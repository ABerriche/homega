class AddSpecialityToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :speciality, :string
  end
end
