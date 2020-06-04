class AddAddresDetailsToDeliveryPoint < ActiveRecord::Migration[6.0]
  def change
    add_column :delivery_points, :uf, :string
    add_column :delivery_points, :cidade, :string
    add_column :delivery_points, :bairro, :string
    add_column :delivery_points, :rua, :string
    add_column :delivery_points, :numero, :string
    add_column :delivery_points, :complemento, :string
  end
end
