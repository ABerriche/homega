class AddAmpmToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :am_pm, :string
  end
end
