class AddColumnToFabricToCarts < ActiveRecord::Migration[6.0]
  def change
    add_reference :fabric_to_carts, :delivery_point, foreign_key: true
  end
end
