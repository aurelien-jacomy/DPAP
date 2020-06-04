class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :delivery_point, optional: true
  has_many :fabrics_to_order, dependent: :destroy

  validates :userid, presence: true
end
