class FabricToCart < ApplicationRecord
  belongs_to :fabric
  has_one :company, through: :fabric
  belongs_to :user
  belongs_to :delivery_point, optional: true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def self.total_price(fabric_to_carts)
  	sum = 0
  	fabric_to_carts.each do |fabric_to_cart|
  		sum += fabric_to_cart.quantity * fabric_to_cart.fabric.price
  	end
  	return sum
  end

  def price
  	quantity * self.fabric.price
  end
end
