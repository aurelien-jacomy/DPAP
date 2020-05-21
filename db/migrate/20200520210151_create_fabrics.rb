class CreateFabrics < ActiveRecord::Migration[6.0]
  def change
    create_table :fabrics do |t|
      t.string :name
      t.string :colour
      t.integer :width
      t.integer :gramatura
      t.string :fabric_type
      t.string :composition
      t.references :company, null: false, foreign_key: true
      t.integer :price
      t.integer :shipment_time
      t.integer :minimum_qty

      t.timestamps
    end
  end
end
