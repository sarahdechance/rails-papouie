class Offer < ApplicationRecord
  belongs_to :user

  validates :name, :hourly_price, :description, presence: true


end
