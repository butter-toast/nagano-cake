class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.status == "入金確認"
        @order.order_details.each do |order_detail|
          order_detail.update(product_status: 1)
        end
      end
      redirect_to request.referer
    else
      render :show
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
