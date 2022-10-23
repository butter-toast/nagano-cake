class ShippingsController < ApplicationController
  
  def create
    @shipping = Shipping.new
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
    redirect_to shippinds_path
  end
  
end