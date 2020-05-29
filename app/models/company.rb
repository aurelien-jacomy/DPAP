class Company < ApplicationRecord
	has_many :fabrics, dependent: :destroy
	validates_format_of :cep, :with => /\A^\d{5}[-]?\d{3}$\Z/i
	validates_format_of :cnpj, :with => /[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}\/?[0-9]{4}\-?[0-9]{2}/
	validates :name, presence: true
	has_one_attached :logo, dependent: :destroy
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :company_users, dependent: :destroy
	has_many :users, through: :company_users
end
