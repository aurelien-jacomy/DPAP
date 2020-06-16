class FabricToCart < ApplicationRecord
  belongs_to :fabric
  has_one :company, through: :fabric
  belongs_to :user
  belongs_to :delivery_point, optional: true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :min_quantity?, :if => :condition_testing?

  def self.total_price(fabric_to_carts)
  	sum = 0
  	fabric_to_carts.each do |fabric_to_cart|
  		sum += fabric_to_cart.quantity * fabric_to_cart.fabric.price unless fabric_to_cart.is_sample
  	end
  	return sum
  end

  def self.total_sample_price(user)
    sum = 0
    fabric_to_carts = FabricToCart.where(user: user).where(is_sample: true)
    fabric_to_carts.each do |fabric_to_cart|
      sum += fabric_to_cart.quantity * fabric_to_cart.fabric.sample_price
    end
    return sum
  end

  def price
  	quantity * self.fabric.price
  end

  def sample_price
  	self.fabric.sample_price
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

  def self.samples(cart)
    samples = []
    cart.each do |x|
      if x.is_sample
        samples << x
      end
    end
  return samples
  end

  private

  def min_quantity?
    if quantity
      if quantity < fabric.minimum_qty
        errors.add(:quantity, "A quantidade mínima para esse item é de #{fabric.minimum_qty}")
      end
    end
  end

  def condition_testing?
    !is_sample
  end
  
end
