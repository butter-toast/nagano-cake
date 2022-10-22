class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    redirect_to admin_products_
  end


  def show
  end

  def edit
  end

  private

  def product_params
    params.require(:product).permit(:profile_image,:name,:introduction,:no_tax_price,:is_sale_status,:product_genre_id)
  end
end
