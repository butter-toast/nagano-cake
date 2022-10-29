class Product < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  has_one_attached:image

  validates :no_tax_price, presence: true

  def with_tax_price
    (no_tax_price * 1.1).floor
  end

  def get_product_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
