class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :categorie
      t.references :user, foreign_key: true
      t.string :address
      t.string :city
      t.string :postal_code
      t.integer :supperficy
      t.string :heating_type
      t.string :building_type
      t.string :kitchen_type
      t.integer :water_room
      t.string :floor
      t.string :status
      t.boolean :chimney
      # t.string :trustee_reference

      t.timestamps
    end
  end
end
