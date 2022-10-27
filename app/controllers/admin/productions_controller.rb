class Admin::ProductionsController < ApplicationController
  def update
    @product_status = OrderDetail.find(params[:id])
    if @product_status.update(production_params)
      redirect_to admin_order_path
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
