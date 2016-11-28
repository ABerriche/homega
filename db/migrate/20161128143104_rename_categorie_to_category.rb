class RenameCategorieToCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :places, :categorie, :category
  end
end
