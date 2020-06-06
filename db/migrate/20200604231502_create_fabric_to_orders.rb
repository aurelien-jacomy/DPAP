class CreateFabricToOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :fabric_to_orders do |t|
      t.references :order, foreign_key: true
      t.references :fabric, foreign_key: true
      t.string :fabric_sku
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
