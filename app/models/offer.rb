class Offer < ApplicationRecord
  belongs_to :user

  validates :name, :hourly_price, :longitude, :latitude, :description, presence: true
  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }


end
