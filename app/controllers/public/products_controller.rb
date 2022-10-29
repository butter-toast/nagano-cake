class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(6)
    @genres = Genre.all
    @allproducts = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem
    @genres = Genre.all
  end



  private
  def product_params
    params.require(:products).permit(:genre_id,:name,:introduction,:no_tax_price)
  end
end
