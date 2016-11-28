class CreateDamages < ActiveRecord::Migration[5.0]
  def change
    create_table :damages do |t|
      t.references :place, foreign_key: true
      t.string :cateogry
      t.boolean :civil_responsability
      t.string :responsability
      t.boolean :breaking
      t.string :value_thief
      t.string :cat_water_damage
      t.string :comment

      t.timestamps
    end
  end
end
