class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :damage, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
