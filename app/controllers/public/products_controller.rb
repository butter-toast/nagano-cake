class Public::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem
  end



  private
  def product_params
    params.require(:products).permit(:genre_id,:name,:introduction,:no_tax_price)
  end
end
