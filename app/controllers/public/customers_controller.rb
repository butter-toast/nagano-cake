class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    current_customer.update(is_withdrawal: true)
    sign_out current_customer
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
  end
end
