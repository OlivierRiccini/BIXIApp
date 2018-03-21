class StationsController < ApplicationController

  def results
    # FX Innovation position
    current_poistion = [45.506318, -73.569021]

    # Call Bixi Api to find stations with bikes available
    url = 'https://api-core.bixi.com/gbfs/en/station_status.json'
    response = HTTParty.get(url)
    body = JSON.parse(response.body)
    stations_status = body['data']['stations']


    # Creation of empty array mixing 'station_status' Api, and 'station_informations' Api
    # which is stored (using the seed) in the DB as Station model to avoid to much Api call
    @stations_with_bikes = []

    stations_status.each do |item|
      if item['num_bikes_available'] == 0
        new_station = Station.find_by(station_id: item['station_id'])
        distance = new_station.distance_to(current_poistion)
        @stations_with_bikes << { id: new_station.id, station_id: new_station.station_id,
                                  name: new_station.name, num_bikes_available: item['num_bikes_available'],
                                  distance_from_current_position: distance, address: new_station.address,
                                  latitude: new_station.latitude, longitude: new_station.longitude }
      end

      # Google maps implementation
      @markers = @stations_with_bikes.map do |station|
        {
          lat: station[:latitude],
          lng: station[:longitude],
          station_id: station[:station_id]
        }
      end
    end

    # Difining and sorting stations by distance from FX Innovation offices
    @stations_with_bikes.sort_by! { |station| station[:distance_from_current_position] }

  end

  def show
    @station = Station.find(params[:id])

    @c_lat = 45.506318
    @c_lng = -73.569021
  end
end
