class StationsController < ApplicationController
  require 'json'

  def results
    current_poistion = [45.506318, -73.569021]
    url = 'https://api-core.bixi.com/gbfs/en/station_status.json'
    response = HTTParty.get(url, :headers =>{'Content-Type' => 'application/json'})
    body = JSON.parse(response.body)
    stations_status = body['data']['stations']

    @stations_with_bikes = []

    stations_status.each do |item|
      if item['num_docks_available'] > 30
        new_station = Station.find_by(station_id: item['station_id'])
        distance = new_station.distance_to(current_poistion)
        @stations_with_bikes << { id: new_station.id, station_id: new_station.station_id,
                                  name: new_station.name, num_bikes_available: item['num_bikes_available'],
                                  distance_from_current_position: distance, address: new_station.address,
                                  latitude: new_station.latitude, longitude: new_station.longitude }
      end

      @markers = @stations_with_bikes.map do |station|
        {
          lat: station[:latitude],
          lng: station[:longitude],
          station_id: station[:station_id] #,
            # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    end

    @stations_with_bikes.sort_by! { |station| station[:distance_from_current_position] }

  end

  def show
    @station = Station.find(params[:id])
  end
end
