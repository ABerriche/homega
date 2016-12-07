class BookingsController < ApplicationController

  def index
    @booking = Booking.new
    @date = params['search']['date']
    @am_pm = params['search']['am_pm']
    #@bookings = current_user.bookings
    @damage = Damage.find(params[:damage_id])
    relevant_providers = Provider.where(category: @damage.category) #, date: @date, am_pm: @am_pm)

    provider_ids = relevant_providers.map do |provider|
      provider.id
    end

    @bookings = Booking.where(date: @date, am_pm: @am_pm)
    unavailable_providers_ids = []

    @bookings.each do |booking|
      if provider_ids.include?(booking.provider_id)
        unavailable_providers_ids << booking.provider_id
      end
    end

    @available_providers = relevant_providers.where.not(id: unavailable_providers_ids)

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
    @damage = Damage.find(params[:booking][:damage_id])
    @booking = Booking.new(booking_params)
    @booking.damage_id = params[:booking][:damage_id]
    @booking.provider_id = params[:booking][:provider_id]
    @booking.date = params[:booking][:date]
    @booking.am_pm = params[:booking][:am_pm]
    if @booking.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:damage_id, :provider_id, :date, :am_pm, :comment)
  end
end
