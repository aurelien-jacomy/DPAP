class LabelImpact < ApplicationRecord
	has_many :labels, dependent: :nullify
	has_many :label_to_fabrics, through: :labels
	has_many :fabrics, through: :labels
end
