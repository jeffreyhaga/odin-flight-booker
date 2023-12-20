class PassengerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.passenger_mailer.confirmation.subject
  #
  def confirmation(booking, passenger)
    @booking = booking
    @passenger = passenger
    @flight = @booking.flight
    destination_code = @flight.arrival_airport.airport_code
    passenger_name = @passenger.name

    mail(to: passenger.email, subject: "Get ready #{passenger_name}, you're off to #{destination_code}!")
  end
end
