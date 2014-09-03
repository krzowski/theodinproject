class Flight < ActiveRecord::Base
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.get_flights(from, to, date)
    end_of_day = date.end_of_day
    find_by_sql ["SELECT * FROM flights 
                 WHERE departure_airport_id = ? AND arrival_airport_id = ?
                 AND date BETWEEN ? AND ?
                 Order by date ASC",
                 from, to, date, end_of_day ]
  end
end
