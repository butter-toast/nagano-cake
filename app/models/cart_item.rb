class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  def subtotal
    #byebug
    product.with_tax_price * quantity
  end

  validates :quantity, presence: true
end
