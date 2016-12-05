class QuotesController < ApplicationController

  before_action :set_place, only: [:new, :create]
  before_action :set_quote, only: [:show, :insure, :update]

  def new
    @quote = Quote.new
    set_price_and_covered_amount(@place.superficy)
    #authorize @quote
  end

  def create
    @quote = Quote.new(quote_params)
    set_price_and_covered_amount(@place.superficy)
    #@quote.price = params['quote']['price']
    #@quote.covered_amount = params['quote']['covered_amount']
    @quote.place = @place
    if @quote.save
      redirect_to insure_path(@quote)
    else
      render :new
    end
  end

  def show
    #@quote = Quote.find(params[:id])
  end

  def update
    @quote.update(quote_params)
  end

  def insure

  end

  def insured
    @quote = Quote.find(params[:quote_id])
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:place_id, :price, :covered_amount, :start_date, :rib, :home_insurance, :contract)
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
