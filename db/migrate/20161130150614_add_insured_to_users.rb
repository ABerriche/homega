class AddInsuredToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :insured, :boolean, default: false
  end
end
