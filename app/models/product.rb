class Product < ApplicationRecord
  has_many :registrationinformations
   has_many :bookimages
end
