class Api::V1::AntipodeController < ApplicationController

  def index
    current_coordinates = GoogleGeocodingService.get_coordinates(params[:location])
    antipode_coordinates = AmypodeService.get_antipode_coordinates(current_coordinates[:lat],current_coordinates[:lng])
    antipode_location = GoogleGeocodingService.get_location(antipode_coordinates)
    antipode_weather = Antipode.weather_summary(antipode_coordinates)
    info = {  forecast: antipode_weather, 
              search_location: params[:location], 
              location_name: antipode_location[:plus_code][:compound_code]
            }
    render json: AntipodeSerializer.new(Antipode.new(info))
  end

end