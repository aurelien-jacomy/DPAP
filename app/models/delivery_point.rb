class DeliveryPoint < ApplicationRecord
  belongs_to :user
  has_many :fabric_to_carts
end
