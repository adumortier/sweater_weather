class Api::V1::AntipodeController < ApplicationController

  def index
    coordinates = GoogleGeocodingService.get_coordinates(params[:location])
    antipode_coordinates = AmypodeService.get_antipode_coordinates(coordinates[:lat],coordinates[:lng])
    weather_forecast = AmypodeService.get_antipode_weather(antipode_coordinates)
    antipode_location = GoogleGeocodingService.get_location(antipode_coordinates)
    info = {  forecast: weather_forecast, 
              search_location: params[:location], 
              location_name: antipode_location[:plus_code][:compound_code]
            }
    render json: AntipodeSerializer.new(Antipode.new(info))
  end

end