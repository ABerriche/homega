class Provider < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :company, presence: true

  has_attachment :photo

end
