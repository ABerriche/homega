class Damage < ApplicationRecord
  belongs_to :place
  has_many :bookings, dependent: :destroy
  has_attachments :photos, maximum: 4

  validates :place_id, presence: true
  validates :category, presence: true, inclusion: {in: ["Dégâts des eaux", "Vol", "Incendie", "Catastrophe naturelle"] }
  validates_presence_of :responsability, :if => lambda { |o| o.category == "Dégâts des eaux" }
  validates_presence_of :value_thief, :if => lambda { |o| o.category == "Vol" }

end
