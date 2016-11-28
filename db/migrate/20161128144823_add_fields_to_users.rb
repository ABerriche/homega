class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sex, :string
    add_column :users, :situation, :string
    add_column :users, :birth_date, :date
    add_column :users, :nb_children, :integer
    add_column :users, :job, :string
  end
end
