class ChangeDataTypeForNbChildren < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :nb_children, :string
  end
end


