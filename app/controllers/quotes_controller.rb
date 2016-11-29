class QuotesController < ApplicationController

  before_action :set_place, only: [:create]

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.place = @place
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def quote_params
    params.require(:quote).permit(:price, :covered_amount)
  end
end
