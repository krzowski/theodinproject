json.array!(@flights) do |flight|
  json.extract! flight, :id, :departure_airport, :arrival_airport, :date, :duration
  json.url flight_url(flight, format: :json)
end
