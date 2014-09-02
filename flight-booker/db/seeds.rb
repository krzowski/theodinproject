Airport.delete_all
Flight.delete_all

airport_list = ["London Rain", "Chicago Wind", 
                "Barcelona Sun", "Guadalajara steal", "Alaska Cold"]
airport_list.each { |a| Airport.create(name: a) }

100.times do
  departure = rand(5) + 6
  arrival = rand(5) + 6
  arrival = arrival % 5 + 6 if departure == arrival 
  date = DateTime.now + rand(4).weeks + rand(24).hours
  duration = 100 + rand(400)
  Flight.create(departure_airport_id: departure, arrival_airport_id: arrival,
                date: date, duration: duration)
end
