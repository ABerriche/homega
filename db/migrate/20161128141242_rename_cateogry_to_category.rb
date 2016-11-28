class RenameCateogryToCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :damages, :cateogry, :category
  end
end
