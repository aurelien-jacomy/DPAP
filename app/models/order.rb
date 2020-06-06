class Order < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :delivery_point, optional: true, dependent: :destroy
  has_many :fabric_to_orders, dependent: :destroy
  has_many :fabrics, through: :fabric_to_orders

  validates :userid, presence: true

  def quantity
  	fabric_orders = fabric_to_orders
  	quantity = 0
  	fabric_orders.each do |f_to_o|
  		quantity += f_to_o.quantity
  	end
  	
  	quantity
  end

  def price
  	fabric_orders = fabric_to_orders
  	price = 0
  	fabric_orders.each do |f_to_o|
  		price += f_to_o.quantity * f_to_o.price
  	end

  	price
  end
end
