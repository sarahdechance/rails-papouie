class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :hourly_price, :description, presence: true

  after_validation :geocode, if: :will_save_change_to_address?
  geocoded_by :address
  
end
