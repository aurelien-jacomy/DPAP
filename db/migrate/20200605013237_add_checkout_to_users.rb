class AddCheckoutToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :checkout_session_id, :string
  end
end
