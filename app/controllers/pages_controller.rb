class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  #ttt
  def home
    @offers = Offer.all
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
    @offers = @user.offers
    @booking_requests = Booking.all.select { |booking| booking.offer.user == @user }
    @pending_requests = Booking.all.select { |booking| booking.offer.user == @user && booking.status == "pending"}
    @accepted_requests = Booking.all.select { |booking| booking.offer.user == @user && booking.status == "validated"}
    @refused_requests = Booking.all.select { |booking| booking.offer.user == @user && booking.status == "refused"}
  end
end
