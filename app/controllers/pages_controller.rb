class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    place_ids = current_user.places.map { |place| place.id }

    @damages = []
    damages = Damage.all.each { |damage| @damages << damage if place_ids.include?(damage.place_id) }

    @quotes = []
    quotes = Quote.all.each { |quote| @quotes << quote if place_ids.include?(quote.place_id) }

  end
end
