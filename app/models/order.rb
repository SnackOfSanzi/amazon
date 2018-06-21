class Order < ApplicationRecord
    has_many :order_products, dependent: :destroy
    has_many :products
    belongs_to :user


  end
