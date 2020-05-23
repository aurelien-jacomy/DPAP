class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company, optional: true
  has_many :fabric_to_carts, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  def cart_by_supplier
  	my_cart = cart
  	cart_by_supplier = {}
  	my_cart.each do |order_item|
  		if cart_by_supplier[order_item.company].nil?
  			cart_by_supplier[order_item.company] = [order_item]
  		else
  			cart_by_supplier[order_item.company] << order_item
  		end
  	end
  	return cart_by_supplier
  end

  def cart
  	FabricToCart.joins(fabric: :company).where(user: self).order('companies.name')
  end
end
