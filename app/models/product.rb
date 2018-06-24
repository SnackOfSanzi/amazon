class Product < ApplicationRecord
  has_many :bookimages
  has_one :registrationinformation
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :likes, dependent: :destroy

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
