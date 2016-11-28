class PlacesController < ApplicationController
  class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @bookings = Booking.where(place_id: @place.id)
    @place = Place.find(params[:id])
    @alert_message = "You are viewing #{@place.name}"
    @place_coordinates = { lat: @place.latitude, lng: @place.longitude }
    @hash = Gmaps4rails.build_markers(@place) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
  end

  def edit

  end

  def update
    @place.update(place_params)
    @hash = Gmaps4rails.build_markers(@place) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
    redirect_to place_path(@place)
  end

  def destroy

  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:category, :address, :postal_code, :city, :superficy, :heating_type, :building_type, :kitchen_type, :water_room, :floor, :status, :chimney, :trustee_reference)
  end
end

end


      t.string :categorie
      t.references :user, foreign_key: true
      t.string :address
      t.string :city
      t.string :postal_code
      t.integer :supperficy
      t.string :heating_type
      t.string :building_type
      t.string :kitchen_type
      t.integer :water_room
      t.string :floor
      t.string :status
      t.boolean :chimney
      t.string :trustee_reference
