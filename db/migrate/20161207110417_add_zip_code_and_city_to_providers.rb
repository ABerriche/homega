class AddZipCodeAndCityToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :zip_code, :string
    add_column :providers, :city, :string
  end
end
