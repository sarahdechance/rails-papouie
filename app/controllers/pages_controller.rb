class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  #tt
  def home
    @offers = Offer.all
  end
end
