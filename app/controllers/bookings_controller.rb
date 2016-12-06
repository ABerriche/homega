class BookingsController < ApplicationController

  def index
    @date = params['search']['date']
    @am_pm = params['search']['am_pm']
    #@bookings = current_user.bookings
    @damage = Damage.find(params[:damage_id])
    @providers = Provider.where(category: @damage.category)
    #@available_providers = providers.
    respond_to do |format|
      #format.html { redirect_to restaurant_path(@restaurant) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def dashboard

  end

  def new
    @booking = Booking.new
  end

  def create
    #raise
    @booking = Booking.new(booking_params)
    @booking.damage_id = params[:damage_id]
    @booking.provider_id = params[:place_id]
    @booking.save
    #flash[:notice] = "Booking request sent to place owner"
    redirect_to place_path(Place.find(params[:place_id]))
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :am_pm, :comment)
  end
end
