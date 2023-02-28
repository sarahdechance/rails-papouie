class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers, dependent: :destroy
  has_one_attached :profile_picture

  validates :first_name, :last_name, :email, presence: true
  validates :pseudo, presence: true, uniqueness: true


  private

  def user_params
    # ne pas oublier la :profile_picture
  end


end
