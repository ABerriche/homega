class Quote < ApplicationRecord
  belongs_to :place

  validates :price, presence: true
  validates :covered_amount, presence: true
  validates :place_id, presence: true

end
