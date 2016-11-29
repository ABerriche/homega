class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.references :place, foreign_key: true
      t.integer :price
      t.integer :covered_amount

      t.timestamps
    end
  end
end
