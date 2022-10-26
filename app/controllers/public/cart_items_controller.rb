class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    if current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id]).present?
      cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.update(quantity: cart_item.quantity)
      redirect_to cart_items_path
    elsif
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
      @cart_items = current_customer.cart_items.all
      render 'index'
    else
      render 'index'
    end
  end

  def update
    # cart_item = current_customer.cart_items.find_by(params[:id])
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    render 'index'
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end



  private
    def cart_item_params
        params.require(:cart_item).permit(:product_id, :quantity)
    end
end

