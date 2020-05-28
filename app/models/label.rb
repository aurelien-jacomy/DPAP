class Label < ApplicationRecord
	has_many :label_to_fabrics, dependent: :destroy
	has_one_attached :photo, dependent: :destroy

	validates :name, presence: true
end
