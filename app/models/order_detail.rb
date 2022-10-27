class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

    def subtotal
    #byebug
    purchase_prise * quantity
  end

end
