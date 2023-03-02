class BookingController < ApplicationController

  #t
  def new
    @booking = Booking.new
  end

  def create
    raise
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])
    @booking.user = current_user
    @booking.offer_id = @offer
    if @booking.save
      redirect_to dashboard_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def validated
    @booking = Booking.find(params[:id])
    @booking.status = "validated"
    @booking.save
    redirect_to dashboard_path
  end

  def refused
    @booking = Booking.find(params[:id])
    @booking.status = "refused"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end



end
