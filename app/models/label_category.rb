class LabelCategory < ApplicationRecord
	has_many :labels, dependent: :nullify
	has_many :label_to_fabrics, through: :labels

	def self.clear
		categories = self.all
		categories.each do |category|
			category.destroy if category.labels.empty?	
		end
	end
end
