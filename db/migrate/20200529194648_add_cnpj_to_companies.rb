class AddCnpjToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :cnpj, :string
  end
end
