class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user
  
  #tt
  def home
    @offers = Offer.all
  end

  def dashboard
    @user = current_user
  end

  private

  def set_user
    @user = current_user
  end

end
