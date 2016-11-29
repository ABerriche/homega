class ProvidersController < ApplicationController

   before_action :set_provider, only: [:show]

  def show
    @provider = Provider.find(params[:id])
  end


  def index
    @providers = Provider.all
  end


  private

  def set_provider
    @user = Provider.find(params[:id])
  end

  def provider_params
    params.require(:user).permit(:first_name, :last_name, :address, :category, :company)
  end

end

