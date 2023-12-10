class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings

  def flight_date_text
    start.strftime("%d/%m/%Y")
  end

  def self.search(search_params)
    flights = Flight.all

    if search_params[:departure_airport_id].present?
      flights = flights.where(departure_airport_id: search_params[:departure_airport_id])
    end

    if search_params[:arrival_airport_id].present?
      flights = flights.where(arrival_airport_id: search_params[:arrival_airport_id])
    end

    if search_params[:start].present?
      date = search_params[:start].to_date
      flights = flights.where('DATE(start) = ?', date)
    end

    flights

  end

end
