class Fabric < ApplicationRecord
  belongs_to :company
  has_many :fabric_to_carts, dependent: :destroy
  has_many :label_to_fabrics, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
