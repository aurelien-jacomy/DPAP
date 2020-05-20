class CreateFabricToCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :fabric_to_carts do |t|
      t.references :fabric, null: false, foreign_key: true
      t.integer :quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
