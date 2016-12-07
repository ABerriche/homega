class ProvidersController < ApplicationController

   before_action :set_provider, only: [:show]

  def show
    @provider = Provider.find(params[:id])
  end


  def index
    #raise
    #providers_with_booking_ids = Provider.all.map do |provider|

    #end
    #@available_providers = providers.booki

  end


  private

  def set_provider
    @user = Provider.find(params[:id])
  end

  def provider_params
    params.require(:user).permit(:first_name, :last_name, :address, :category, :company, :photo)
  end

end

