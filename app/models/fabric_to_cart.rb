class FabricToCart < ApplicationRecord
  belongs_to :fabric
  has_one :company, through: :fabric
  belongs_to :user

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
