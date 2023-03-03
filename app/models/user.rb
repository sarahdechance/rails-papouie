class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers, dependent: :destroy
  has_many :bookings
  has_one_attached :avatar

  validates :first_name, :last_name, :email, presence: true
  validates :pseudo, presence: true, uniqueness: true


end
