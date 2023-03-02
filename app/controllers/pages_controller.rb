class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user

  #ttt
  def home
    @offers = Offer.all
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
    @offers = @user.offers
    @pending_bookigns = []
    @bookings_requests = Booking.all.select { |booking| booking.user == @user }
  end

  private

  def set_user
    @user = current_user
  end

end
