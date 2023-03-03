class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy validated refused]

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      redirect_to dashboard_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  def validated
    @booking.status = "validated"
    @booking.save
    redirect_to dashboard_path
  end

  def refused
    @booking.status = "refused"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

end
