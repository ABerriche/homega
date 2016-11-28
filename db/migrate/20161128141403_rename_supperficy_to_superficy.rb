class RenameSupperficyToSuperficy < ActiveRecord::Migration[5.0]
  def change
    rename_column :places, :supperficy, :superficy
  end
end
