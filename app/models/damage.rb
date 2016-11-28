class Damage < ApplicationRecord
  belongs_to :place
  has_many :bookings, dependent: :destroy

  validates :place_id, presence: true
  validates :category, presence: true
  validates :civil_responsability, presence: true
  validates :responsability, presence: true
  validates :breaking, presence: true
  validates :value_thief, presence: true
  validates :cat_water_damage, presence: true
  validates :comment, presence: true

end
