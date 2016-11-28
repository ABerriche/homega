class ChangeCommentFromStringToText < ActiveRecord::Migration[5.0]
  def change
    change_column :damages, :comment, :text
  end
end
