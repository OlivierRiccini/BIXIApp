# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Station.destroy_all

url = 'https://api-core.bixi.com/gbfs/en/station_information.json/'
    response = HTTParty.get(url, :headers =>{'Content-Type' => 'application/json'})
    body = JSON.parse(response.body)
    stations = body['data']['stations']

stations.each do |station|
  new_station = Station.new(station_id: station['station_id'], name: station['name'], lat: station['lat'], lng: station['lon'], capacity: station['capacity'])
  new_station.save
end
