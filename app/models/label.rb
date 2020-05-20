class Label < ApplicationRecord
	has_many :label_to_fabrics, dependent: :destroy

	validates :name, presence: true
end
