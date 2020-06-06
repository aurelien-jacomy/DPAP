class AddCustomerToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :customer, :string
  end
end
