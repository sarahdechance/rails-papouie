class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :status, inclusion: { in: ["pending", "validated", "refused"] }
  validates :start_date, :end_date, :status, presence: true
end
