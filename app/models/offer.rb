class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :hourly_price, :description, presence: true


end
