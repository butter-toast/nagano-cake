class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :cart_items
  has_many :shippings
  has_many :orders


  validates :last_name, presence:true
  validates :first_name, presence:true
  validates :last_name_kana, presence:true
  validates :first_name_kana, presence:true
  validates :post_code, presence:true
  validates :address, presence:true
  validates :email, presence:true

  def full_name
    self.last_name + " " + self.first_name
  end

end
