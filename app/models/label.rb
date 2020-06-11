class Label < ApplicationRecord
	has_many :label_to_fabrics, dependent: :destroy
	belongs_to :label_category
	belongs_to :label_impact

	has_one_attached :photo, dependent: :destroy

	validates :name, presence: true
end
