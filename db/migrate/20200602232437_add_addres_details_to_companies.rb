class AddAddresDetailsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :uf, :string
    add_column :companies, :cidade, :string
    add_column :companies, :bairro, :string
    add_column :companies, :rua, :string
    add_column :companies, :numero, :string
    add_column :companies, :complemento, :string
  end
end
