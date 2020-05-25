class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fabric_to_carts, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  
  has_one :owned_company, foreign_key: "user_id", class_name: "Company" 
  
  has_one :company_user
  has_one :company, through: :company_user

end
