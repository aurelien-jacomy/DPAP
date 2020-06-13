class CreateLabelImpacts < ActiveRecord::Migration[6.0]
  def change
    create_table :label_impacts do |t|
      t.string :name

      t.timestamps
    end
  end
end
