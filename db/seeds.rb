# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Terminal.destroy_all
Business.destroy_all
Terminal.create(name: "Terminal 1")
Terminal.create(name: "Terminal 2")
Terminal.create(name: "Terminal 3")
Terminal.create(name: "International Terminal")

response = HTTParty.get('http://www.flysfo.com/api/dining.json?offset=0&limit=70&key='+ENV['SFO_KEY'])
response.each do |place|
  next if place['terminal'] == "Rental Car Center"
  restaurant = Business.new
  restaurant.name = place['node_title']
  restaurant.description = place['body']
  restaurant.location_summary = place['location_summary']
  restaurant.start_time = place['hours'][0..25].match(/..:...a.m/)
  restaurant.end_time = place['hours'].match(/..:...p.m/)
  restaurant.image = place['image']
  restaurant.security = false if place['security'] == "Pre-Security"
  Terminal.where(name: place['terminal']).first.businesses << restaurant
  restaurant.save
end
