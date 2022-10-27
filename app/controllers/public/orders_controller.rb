class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.status = 0
    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.product_id = cart_item.product_id
        order_detail.quantity = cart_item.quantity
        order_detail.purchase_prise = cart_item.product.with_tax_price
        order_detail.save
      end
      redirect_to complete_orders_path
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
      if Shipping.exists?(id: params[:order][:registered])
        @shipping = Shipping.find(params[:order][:registered])
        @order.name = @shipping.name
        @order.address = @shipping.address
        @order.post_code = @shipping.post_code
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.shippings.new(shipping_params)
      if address_new.save
        @order.name = address_new.name
        @order.address = address_new.address
        @order.post_code = address_new.post_code
      else
        render :new
      end
    end
    if params[:order][:pay_method] == "1"
      @pay_method = "クレジットカード"
    elsif params[:order][:pay_method] == "2"
      @pay_method = "銀行振込"
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, product| sum + product.subtotal }
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :total_price, :pay_method, :post_code)
  end

  def shipping_params
    params.require(:order).permit(:name, :address, :post_code)
  end

end
