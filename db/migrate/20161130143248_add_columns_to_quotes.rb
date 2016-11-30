class AddColumnsToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :start_date, :date
    add_column :quotes, :home_insurance, :boolean
    add_column :quotes, :rib, :string
  end
end
