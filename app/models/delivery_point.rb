class DeliveryPoint < ApplicationRecord
  belongs_to :user
  has_many :fabric_to_carts, dependent: :nullify
  has_many :orders, dependent: :nullify

  def to_s
  	[name, rua, numero, bairro, cep, cidade, uf, "comment: #{comment}", "contact: #{contact}"].join(";")
  end
end
