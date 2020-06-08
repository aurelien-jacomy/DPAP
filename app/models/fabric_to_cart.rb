class FabricToCart < ApplicationRecord
  belongs_to :fabric
  has_one :company, through: :fabric
  belongs_to :user
  belongs_to :delivery_point, optional: true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :min_quantity?

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

  def self.cart_by_supplier(cart)
    cart_by_supplier = {}
    cart.each do |order_item|
      if cart_by_supplier[order_item.company].nil?
        cart_by_supplier[order_item.company] = [order_item]
      else
        cart_by_supplier[order_item.company] << order_item
      end
    end
    return cart_by_supplier
  end

  private

  def min_quantity?
    if quantity
      if quantity < fabric.minimum_qty
        errors.add(:quantity, "A quantidade mínima para esse item é de #{fabric.minimum_qty}")
      end
    end
  end
  
end
