class BookingController < ApplicationController

  def index
    # passer par le dashboard
    @bookigs = Bookings.where(user_id:  )
  end

  def show
    # passer par le dashboard
  end

  def new
    #
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
