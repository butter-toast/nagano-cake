class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum status: {
     "入金待ち": 0,
     "入金確認": 1,
     "製作中": 2,
     "発送準備中": 3,
     "発送済み": 4
  }

  enum pay_method: ["クレジットカード", "銀行振込"]

  def total
    total_price + shipping_fee
  end
end
