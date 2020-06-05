class DeliveryPoint < ApplicationRecord
  belongs_to :user
  has_many :fabric_to_carts

  def to_s
  	[name, rua, numero, bairro, cep, cidade, uf, "comment: #{comment}", "contact: #{contact}"].join(";")
  end
end
