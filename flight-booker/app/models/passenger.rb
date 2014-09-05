class Passenger < ActiveRecord::Base
  belongs_to :booking
  has_one :flight, through: :booking
end
