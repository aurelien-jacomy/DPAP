class RemoveBillingAddressFromCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :billing_address, :string
  end
end
