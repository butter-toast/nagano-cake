class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  def subtotal
    product.with_tax_price * quantity
  end
end
