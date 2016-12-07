class RemoveAlreadyInsuredFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :already_insured
  end
end
