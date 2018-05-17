class Order < ApplicationRecord
    has_many :order_products, dependent: :destroy
    has_many :products,  dependent: :destroy


  end
