class Damage < ApplicationRecord
  belongs_to :place
  has_many :bookings, dependent: :destroy

  validates :place_id, presence: true
  validates :category, presence: true, inclusion: {in: ["Dégâts des eaux", "Vol", "Incendie", "Catastrophe naturelle"] }
  validates :responsability, presence: true
  validates :value_thief, presence: true
  validates :cat_water_damage, presence: true

end
