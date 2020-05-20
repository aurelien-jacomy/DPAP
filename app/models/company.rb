class Company < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :fabrics, dependent: :destroy

	validates_format_of :cep, :with => /\A^\d{5}[-]?\d{3}$\Z/i
	validates :name, presence: true
end
