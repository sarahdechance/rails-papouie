
class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @query = params[:query]
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.joins(:user).order('rating DESC')
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
    @booking.offer = @offer
    @markers =
      [{
        lat: @offer.latitude,
        lng: @offer.longitude
      }]
  end

  def new
    @offer = Offer.new()
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render 'edit', status: :unprocessable_entity
    end

  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :hourly_price, :availability_start, :availability_end, :latitude, :longitude, :description, :address )
    # quid aj current user?
  end

end
