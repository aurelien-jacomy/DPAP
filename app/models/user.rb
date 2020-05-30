class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fabric_to_carts, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :delivery_points, dependent: :destroy

  has_one :owned_company, foreign_key: "user_id", class_name: "Company" 
  has_one :company_user, dependent: :destroy
  has_one :company, through: :company_user

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

  def what_company
    owned_company ? owned_company : company
  end

end
