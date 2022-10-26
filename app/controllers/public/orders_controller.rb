class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OtherDetail.new
        order_detail.product_id = cart_item.product_id
        order_detail.order_quantity = cart_item.quantity
        order_detail.order_price = cart_item.product.with_tax_price
        order_detail.save
      end
      redirect_to new_order_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def log
    @order = Order.new
    if params[:order][:address_number] == "1"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.post_code = current_customer.post_code
    elsif params[:order][:address_number] == "2"
      if Shipping.exists?(name: params[:order][:registered])
        @shipping = Shippng.find(params[:order][:shipping_id])
        @order.name = @shipping.name
        @order.address = @shipping.address
        @order.post_code = @shipping.post_code
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.shippings.new(shipping_params)
      if address_new.save
      else
        render :new
      end
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, product| sum + product.subtotal }
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :total_price)
  end

  def shipping_params
    params.require(:order).permit(:name, :address)
  end

end
