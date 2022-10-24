class Public::ShippingsController < ApplicationController

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.save
    redirect_to shippings_path
  end

  def index
    @shipping = Shipping.new
    @shippings = Shipping.all
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    @shipping.update(shipping_params)
    redirect_to shippings_path
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to shippings_path
  end

  private
  def shipping_params
    params.require(:shipping).permit(:name, :post_code, :address)
  end

end