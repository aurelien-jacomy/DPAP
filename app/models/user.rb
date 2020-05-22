class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  has_many :fabric_to_carts, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
end
