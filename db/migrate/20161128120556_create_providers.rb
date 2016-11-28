class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :category
      t.string :company

      t.timestamps
    end
  end
end
