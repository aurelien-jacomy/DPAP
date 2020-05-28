class CreateDeliveryPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_points do |t|
      t.string :name
      t.string :address
      t.string :cep
      t.string :contact
      t.text :comment
      t.boolean :favourite
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
