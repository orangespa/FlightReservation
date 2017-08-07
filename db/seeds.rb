AirportList = ["LHR", "CDG", "AMS", "FRA", "IST", "MAD", "BCN", "LGW", "MUC", "FCO"]
AirportList.each do |f|
   Airport.create!(airport_code: f)
   end 
airports=Airport.all
99.times do |f|
    airport = airports.sample(2)
    departure_date = rand (20170807 .. 20170814)
    departure_airport = airport.first
    arrival_airport = airport.last
    duration = rand(1..40)
    Flight.create!(departure_date: departure_date,
                departure_airport: departure_airport,
                arrival_airport: arrival_airport,
                duration: duration)
    end
