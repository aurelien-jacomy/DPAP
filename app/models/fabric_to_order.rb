class FabricToOrder < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :fabric, optional: true

  validates :fabric_sku, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
