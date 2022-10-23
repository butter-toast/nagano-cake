class CartItem < ApplicationRecord
  belongs_to :product

  def subtotal
    product.with_tax_price * quantity
  end
end
