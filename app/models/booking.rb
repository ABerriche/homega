class Booking < ApplicationRecord
  belongs_to :Damage
  belongs_to :prestataire
end
