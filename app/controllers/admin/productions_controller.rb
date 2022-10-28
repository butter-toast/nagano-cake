class Admin::ProductionsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(production_params)
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
