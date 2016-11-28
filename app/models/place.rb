class Place < ApplicationRecord
  belongs_to :user
  has_many :damages, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true, inclusion: {in: ["Hotel", "Appartement", "Chateau", "Loft", "Maison"]}
  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :superficy, presence: true, numericality:{ only_integer: true }
  validates :heating_type, presence: true
  validates :building_type, presence: true
  validates :kitchen_type, presence: true
  validates :water_room, presence: true, numericality:{ only_integer: true }
  validates :floor, presence: true
  validates :status, presence: true

end
