class Offer < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings
  validates :name, :hourly_price, :description, presence: true
end
