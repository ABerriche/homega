class Booking < ApplicationRecord
  belongs_to :damage
  belongs_to :provider

  validates :damage_id, presence: true
  validates :provider_id, presence: true
  validates :date, presence: true
  validates :am_pm, presence: true

end
