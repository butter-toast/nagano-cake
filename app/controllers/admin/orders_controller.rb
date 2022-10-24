class Admin::OrdersController < ApplicationController
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to request.referer
    else
      render :show
    end
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
