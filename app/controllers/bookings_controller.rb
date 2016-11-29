class BookingsController < ApplicationController

  def index
    #@bookings = current_user.bookings
  end

  def dashboard

  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.damage_id = params[:damage_id]
    @booking.provider_id = params[:place_id]
    @booking.save
    #flash[:notice] = "Booking request sent to place owner"
    redirect_to place_path(Place.find(params[:place_id]))
  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def rejected
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
