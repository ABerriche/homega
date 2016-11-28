class AddProvidersToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :provider, index: true
  end
end
