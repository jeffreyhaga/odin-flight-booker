class FlightsController < ApplicationController

  def index
    if search_params_present?
      @flights = Flight.search(search_params)
    else
      @flights = Flight.all
    end
    @passenger_count = params[:passengers]

  end


  private

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :start, :passengers)
  end

  def search_params_present?
    search_params.values.any?(&:present?)
  end

end
