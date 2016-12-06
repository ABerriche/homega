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

  def devis
    @place = Place.find(params[:id])
    @quote = Quote.new
    set_price_and_covered_amount(@place.superficy)
  end


  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :category, :address, :superficy, :heating_type, :building_type, :kitchen_type, :water_room, :floor, :status, :chimney, :trustee_reference, :contrat)
  end

  def set_price_and_covered_amount(superficy)
    if superficy < 30
      @quote.price = 100
      @quote.covered_amount = 10000
    elsif superficy < 55
      @quote.price = 110
      @quote.covered_amount = 12000
    elsif superficy < 80
      @quote.price = 120
      @quote.covered_amount = 14000
    elsif superficy < 105
      @quote.price = 130
      @quote.covered_amount = 16000
    elsif superficy < 130
      @quote.price = 140
      @quote.covered_amount = 18000
    elsif superficy < 155
      @quote.price = 150
      @quote.covered_amount = 20000
    elsif superficy < 180
      @quote.price = 160
      @quote.covered_amount = 22000
    elsif superficy < 205
      @quote.price = 170
      @quote.covered_amount = 24000
    elsif superficy < 230
      @quote.price = 180
      @quote.covered_amount = 26000
    elsif superficy < 255
      @quote.price = 190
      @quote.covered_amount = 28000
    elsif superficy < 280
      @quote.price = 200
      @quote.covered_amount = 30000
    elsif superficy < 305
      @quote.price = 210
      @quote.covered_amount = 32000
    elsif superficy < 330
      @quote.price = 220
      @quote.covered_amount = 34000
    elsif superficy < 355
      @quote.price = 230
      @quote.covered_amount = 36000
    elsif superficy < 380
      @quote.price = 240
      @quote.covered_amount = 38000
    else
      @quote.price = 250
      @quote.covered_amount = 40000
    end
  end
end


