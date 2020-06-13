class AddSamplePriceToFabrics < ActiveRecord::Migration[6.0]
  def change
    add_column :fabrics, :sample_price, :integer
  end
end
