class LabelImpact < ApplicationRecord
	has_many :labels, dependent: :nullify
	has_many :label_to_fabrics, through: :labels

	def self.clear
		impacts = self.all
		impacts.each do |impact|
			impact.destroy if impact.labels.empty?	
		end
	end
end
