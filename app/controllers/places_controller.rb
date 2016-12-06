class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy, :insured]

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if params['place']['chimney'] == "Oui"
      @place.chimney = true
    elsif params['place']['chimney'] == "Non"
      @place.chimney = false
    end
    @place.user = current_user
    if @place.save
      if @place.latitude.nil?
        raise
        flash[:alert] = "Merci de saisir une adresse proposée dans les..."
        render :new
      else
        redirect_to new_place_quote_path(@place)
      end
    else
      raise
      render :new
    end
  end

  def show
    @places = Place.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/places/map_box", locals: { place: place })
    end
  end

  def update
    @place.update(place_params)
    #redirect_to place_path(@place)
    redirect_to new_place_quote_path(@place)
  end

  def insured
  end



  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :category, :address, :superficy, :heating_type, :building_type, :kitchen_type, :water_room, :floor, :status, :chimney, :trustee_reference, :contrat)
  end
end


