class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if signed_in?
      place_ids = current_user.places.map { |place| place.id }

      @damages = []
      damages = Damage.all.each { |damage| @damages << damage if place_ids.include?(damage.place_id) }

      @quotes = []
      quotes = Quote.all.each { |quote| @quotes << quote if place_ids.include?(quote.place_id) }

      @places = Place.where.not(latitude: nil, longitude: nil)

      @hash = Gmaps4rails.build_markers(@places.where(user_id: current_user.id)) do |place, marker|
        marker.lat place.latitude
        marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/places/map_box", locals: { place: place })
    end
    end
  end
end
