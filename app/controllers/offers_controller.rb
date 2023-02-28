class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @current_user = User.find(current_user)
    @offer.user = @current_user
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
    redirect_to offers_path, status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:hourly_price, :availability_start, :availability_end, :latitude, :longitude, :description)
    # quid aj current user?
  end

end
