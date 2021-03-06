class DamagesController < ApplicationController

  before_action :set_damage, only: [:show, :edit]

  def new
    @places = current_user.places.map { |place| place.name }
    @place_id = params['place_id']
    if @place_id
      @place = Place.find(@place_id)
    end
    @damage = Damage.new
  end

  def create
    place_id = current_user.places.where(name: params[:damage][:place_id]).as_json[0]["id"]
    @damage = Damage.new(damage_params)
    @damage.place_id = place_id
    #raise
    if @damage.save
      redirect_to damage_path(@damage)
    #else
    #  render :new
    end
  end

  def show
    @booking = Booking.new
    @providers = Provider.where(category: @damage.category)
  end

  def edit

  end

  private

  def set_damage
    @damage = Damage.find(params[:id])
  end

  def damage_params
    params.require(:damage).permit(:place_id, :category, :civil_responsability, :responsability, :breaking, :value_thief, :cat_water_damage, :comment, photos: [])
  end

end
