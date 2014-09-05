class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
  end

  def new
    @flight = Flight.find(params[:pick])
    @booking = @flight.bookings.build
    Integer(params[:number_of_passengers]).times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.new(booking_params)
    if @booking.save
      @booking.passengers.each { |p| PassengerMailer.thank_you_email(p).deliver }
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
