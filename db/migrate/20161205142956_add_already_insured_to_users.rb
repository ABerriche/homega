class AddAlreadyInsuredToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :already_insured, :boolean
  end
end
