class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :pseudo, presence: true, uniqueness: true
end
