class Admin::ProductionsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    order = Order.find_by(id: @order_detail.order_id)
    if @order_detail.update(production_params)
      update_order_status_flag = true
      order.order_details.each do |order_detail|
        unless order_detail.product_status == 3
          update_order_status_flag = false
          break
        end
      end
      if @order_detail.product_status == 2 then order.update(status: 2)
      elsif @order_detail.product_status == 3 && update_order_status_flag
        order.update(status: 3)
      end
      redirect_to request.referer
    else
      @order = Order.find(params[:id])
      render template: "admin/orders/show"
    end
  end

  private

  def production_params
    params.require(:order_detail).permit(:product_status)
  end
end
