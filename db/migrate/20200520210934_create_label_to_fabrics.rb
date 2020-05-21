class CreateLabelToFabrics < ActiveRecord::Migration[6.0]
  def change
    create_table :label_to_fabrics do |t|
      t.references :label, null: false, foreign_key: true
      t.references :fabric, null: false, foreign_key: true

      t.timestamps
    end
  end
end
