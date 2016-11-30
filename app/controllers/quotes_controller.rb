class QuotesController < ApplicationController

  before_action :set_place, only: [:new, :create]
  before_action :set_quote, only: [:show, :insure]

  def new
    @quote = Quote.new
    create
    #authorize @quote
  end

  def create
    @quote = Quote.new #(quote_params)
    if @place.superficy < 30
      @quote.price = 100
      @quote.covered_amount = 10000
    elsif @place.superficy < 55
      @quote.price = 110
      @quote.covered_amount = 12000
    elsif @place.superficy < 80
      @quote.price = 120
      @quote.covered_amount = 14000
    elsif @place.superficy < 105
      @quote.price = 130
      @quote.covered_amount = 16000
    elsif @place.superficy < 130
      @quote.price = 140
      @quote.covered_amount = 18000
    elsif @place.superficy < 155
      @quote.price = 150
      @quote.covered_amount = 20000
    elsif @place.superficy < 180
      @quote.price = 160
      @quote.covered_amount = 22000
    elsif @place.superficy < 205
      @quote.price = 170
      @quote.covered_amount = 24000
    elsif @place.superficy < 230
      @quote.price = 180
      @quote.covered_amount = 26000
    elsif @place.superficy < 255
      @quote.price = 190
      @quote.covered_amount = 28000
    elsif @place.superficy < 280
      @quote.price = 200
      @quote.covered_amount = 30000
    elsif @place.superficy < 305
      @quote.price = 210
      @quote.covered_amount = 32000
    elsif @place.superficy < 330
      @quote.price = 220
      @quote.covered_amount = 34000
    elsif @place.superficy < 355
      @quote.price = 230
      @quote.covered_amount = 36000
    elsif @place.superficy < 380
      @quote.price = 240
      @quote.covered_amount = 38000
    else
      @quote.price = 250
      @quote.covered_amount = 40000
    end
    @quote.place = @place
    if @quote.save
      redirect_to quote_path(id: @quote.id)
    else
    end
  end

  def show
    #@quote = Quote.find(params[:id])
  end

  def insure

  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:place_id, :price, :covered_amount)
  end
end
