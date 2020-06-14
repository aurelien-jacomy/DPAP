class AddIsSampleToFabricToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :fabric_to_carts, :is_sample, :boolean
  end
end
