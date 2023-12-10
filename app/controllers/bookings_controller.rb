class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    passenger_count = params[:passengers].to_i

    passenger_count.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = Booking.new(booking_params)
    @booking.flight = @flight

    if @booking.save
      redirect_to @booking, notice: "Your booking was successful!"
    else
      # Ensure @flight is set when re-rendering :new
      render :new
    end

  end

  def show
    @booking = Booking.find(params[:id])

    @flight = @booking.flight

  end

  def index
    @bookings = Booking.all

  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end

end
