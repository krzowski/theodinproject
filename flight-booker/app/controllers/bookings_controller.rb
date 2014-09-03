class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
  end

  def new
    @number_of_passengers = Integer(params[:number_of_passengers])
    @flight = Flight.find(params[:pick])
    @booking = @flight.bookings.build
    @number_of_passengers.times do
      @passenger = @booking.passengers.build
    end
  end

  def create
    @number_of_passengers = Integer(params[:number_of_passengers])
    @booking = Flight.find(params[:flight_id]).bookings.build(booking_params)
    if @booking.save
      @number_of_passengers.times do |n|
        @passenger = @booking.passengers.build(booking_params[:passengers_attributes][n])
      end
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id,
                                passengers_attributes: [:name, :email])
    end
end
