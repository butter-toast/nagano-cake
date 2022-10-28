class Admin::ProductionsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(production_params)
      if @order_detail.product_status == 2
        order = Order.find_by(id: @order_detail.order_id)
        order.update(status: 2)
      elsif @order_detail.product_status == 3
        order = Order.find_by(id: @order_detail.order_id)
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
