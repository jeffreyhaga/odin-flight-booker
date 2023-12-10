# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed Airports
Airport.create(airport_code: 'YYZ') # Toronto
Airport.create(airport_code: 'YOW') # Ottawa
Airport.create(airport_code: 'SFO') # San Francisco
Airport.create(airport_code: 'MEX') # Mexico City

# Fetching airports by their airport_code
toronto = Airport.find_by(airport_code: 'YYZ')
ottawa = Airport.find_by(airport_code: 'YOW')
san_francisco = Airport.find_by(airport_code: 'SFO')
mexico_city = Airport.find_by(airport_code: 'MEX')

# Seed flights
Flight.create(departure_airport: toronto, arrival_airport: ottawa, start: DateTime.now + 1.day, duration: 90)
Flight.create(departure_airport: ottawa, arrival_airport: toronto, start: DateTime.now + 2.days, duration: 90)
Flight.create(departure_airport: toronto, arrival_airport: san_francisco, start: DateTime.now + 3.days, duration: 300)
Flight.create(departure_airport: san_francisco, arrival_airport: toronto, start: DateTime.now + 4.days, duration: 300)
Flight.create(departure_airport: ottawa, arrival_airport: mexico_city, start: DateTime.now + 5.days, duration: 240)
Flight.create(departure_airport: mexico_city, arrival_airport: ottawa, start: DateTime.now + 6.days, duration: 240)
Flight.create(departure_airport: san_francisco, arrival_airport: mexico_city, start: DateTime.now + 7.days, duration: 270)
Flight.create(departure_airport: mexico_city, arrival_airport: san_francisco, start: DateTime.now + 8.days, duration: 270)
