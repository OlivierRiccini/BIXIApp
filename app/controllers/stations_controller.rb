class StationsController < ApplicationController
  require 'json'

  def results
    url = 'https://api-core.bixi.com/gbfs/en/station_status.json'
    response = HTTParty.get(url, :headers =>{'Content-Type' => 'application/json'})
    body = JSON.parse(response.body)
    stations_status = body['data']['stations']

    @stations_with_bikes = []

    stations_status.each do |item|
      if item['num_bikes_available'] == 0
        new_station = Station.find_by(station_id: item['station_id'])
        @stations_with_bikes << {id: new_station.id, station_id: new_station.station_id, name: new_station.name, num_bikes_available: item['num_bikes_available']}
      end
    end

    @stations_with_bikes.sort_by! { |station| station[:num_bikes_available] }
  end

  def show
    @station = Station.find(params[:id])
  end
end
