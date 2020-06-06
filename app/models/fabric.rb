class Fabric < ApplicationRecord
  belongs_to :company
  has_many :fabric_to_carts, dependent: :destroy
  has_many :label_to_fabrics, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  has_many :fabric_to_orders, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  $colors = ["Preto", "Branco", "Vermelho", "Verde", "Azul", "Amarelo", "Roxo", "Laranja"]
  $fabric_type = ["Algodão", "Malha", "Linho", "Camurça", "Seda"]

  


  include PgSearch::Model
  pg_search_scope :search_by_name_colour_width_gramatura_composition_and_fabric_type,
    against: [ :name, :colour, :width, :gramatura, :composition, :fabric_type ],
    using: {
      tsearch: { prefix: true } 
    }


end
