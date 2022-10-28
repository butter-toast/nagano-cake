class Shipping < ApplicationRecord
  belongs_to :customer

  def pc_name_address
    "〒" + self.post_code + " " + self.address + " " + self.name
  end
end
