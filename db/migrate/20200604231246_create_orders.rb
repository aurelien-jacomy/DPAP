class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :userid
      t.references :delivery_point, foreign_key: true
      t.string :delivery_address
      t.string :checkout_session_id
      t.string :status
      t.timestamp :paid_at

      t.timestamps
    end
  end
end
