class Product < ApplicationRecord
  has_many :bookimages
  has_one :registrationinformation
end
