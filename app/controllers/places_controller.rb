class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def new
    @place = Place.new
  end

  def create
    Typeform.api_key = ENV['TYPEFORM_API_KEY']
    typeform_id = "xG5yPv"
    form = Typeform::Form.new(typeform_id)
    all_entries = form.all_entries
    incomplete_entries = form.incomplete_entries
    complete_entries = form.complete_entries
    raise
    # @address = all_entries.to_hash.
    "xG5yPv"
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to new_place_quote_path(@place)
    else
      render :new
    end
  end

  def edit
    @places = Place.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/places/map_box", locals: { place: place })
    end
  end

  def update
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  def show
    @place = Place.find(params[:id])
    @place_coordinates = { lat: @place.latitude, lng: @place.longitude }
    @alert_message = "You are viewing #{@place.name}"
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :category, :address, :postal_code, :city, :superficy, :heating_type, :building_type, :kitchen_type, :water_room, :floor, :status, :chimney, :trustee_reference)
  end
end


