class AddSupplierToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :supplier, :string
  end
end
