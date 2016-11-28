class Place < ApplicationRecord
  belongs_to :user
  has_many :damages, dependent: :destroy

  validates categorie, presence: true
  validates address, presence: true
  validates city, presence: true
  validates postal_code, presence: true
  validates superficy, presence: true
  validates heating_type, presence: true
  validates building_type, presence: true
  validates kitchen_type, presence: true
  validates water_room, presence: true
  validates floor, presence: true
  validates status, presence: true
  validates chimney, presence: true

end
