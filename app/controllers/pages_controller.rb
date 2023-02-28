class PagesController < ApplicationController
  def home
    @offers = Offer.all
  end
end
