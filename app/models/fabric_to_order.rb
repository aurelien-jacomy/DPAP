class FabricToOrder < ApplicationRecord
  belongs_to :order, optional: true, dependent: :destroy
  belongs_to :fabric, optional: true, dependent: :destroy

  validates :fabric_sku, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
