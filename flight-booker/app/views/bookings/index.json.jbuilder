json.array!(@bookings) do |booking|
  json.extract! booking, :id, :address, :phone
  json.url booking_url(booking, format: :json)
end
