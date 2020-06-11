class AddColumnsToLabels < ActiveRecord::Migration[6.0]
  def change
    add_column :labels, :full_name, :string
    add_reference :labels, :label_impact, foreign_key: true
    add_column :labels, :apply_on, :string
    add_reference :labels, :label_category, foreign_key: true
    add_column :labels, :website, :string
    add_column :labels, :description, :text
  end
end
