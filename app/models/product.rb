class Product < ApplicationRecord
  has_many :cart_items

  validates :no_tax_price, presence: true

  def with_tax_price
    (no_tax_price * 1.1).floor
  end

end
