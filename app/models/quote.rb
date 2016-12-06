class Quote < ApplicationRecord
  belongs_to :place

  validates :price, presence: true
  validates :covered_amount, presence: true
  validates :place_id, presence: true
  validates :rib, format: { with: /FR\d{2}[ ]\d{4}[ ]\d{4}[ ]\d{4}[ ]\d{4}[ ]\d{4}|CZ\d{22}/}


end
