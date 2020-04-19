class Api::V1::ForecastController < ApplicationController

  def index
    coordinates = GoogleGeocodingService.get_coordinates(params[:location])
    weather_data = OpenWeatherService.get_weather_data(coordinates[:lat], coordinates[:lng])
    forecast = WeatherInfo.new(weather_data, params[:location])
    render json: WeatherInfoSerializer.new(forecast)
  end

end