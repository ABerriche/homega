class AddAlreadyInsuredToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :already_insured, :boolean
  end
end
