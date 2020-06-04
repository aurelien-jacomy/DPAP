class RemoveAddressFromDeliveryPoint < ActiveRecord::Migration[6.0]
  def change
    remove_column :delivery_points, :address, :string
  end
end
