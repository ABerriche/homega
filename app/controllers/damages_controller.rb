class DamagesController < ApplicationController

  before_action :set_damage, only: [:show]

  def new
    @places = current_user.places.map { |place| place.name }
    @damage = Damage.new
  end

  def create
    @damage = Damage.new
    if @damage.save
      redirect_to damage_path(@damage)
    else
      render :new
    end
  end

  def show

  end

  private

  def set_damage
    @damage = Damage.find(params[:id])
  end

  def damage_params
    require.params(:damage).permit(:category, :civil_responsablity, :responsability, :breaking, :value_thief, :cat_water_damage, :comment)
  end

end
