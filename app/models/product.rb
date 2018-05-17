class Product < ApplicationRecord
  has_many :bookimages
  has_one :registrationinformation
  has_many :order_products
  has_many :orders, through: :order_products
end
