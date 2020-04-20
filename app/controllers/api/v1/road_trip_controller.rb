class Api::V1::RoadTripController < ApplicationController

  def create 
    user = User.where(api_key: params[:api_key]).first
    if user.nil?
      render json: ErrorSerializer.new(Error.new('Your API key is invalid')), status: 401
    else
      travel_time = GoogleDirectionService.get_travel_time(params[:origin],params[:destination])
      coordinates = GoogleGeocodingService.get_coordinates(params[:destination])
      weather_data = OpenWeatherService.get_weather_data(coordinates[:lat], coordinates[:lng])
      arrival_time = Time.at(((Time.now.to_i + travel_time)/(60*60.0)).round*(60*60))
      hourly_forecast = WeatherForecast.new(weather_data).forecast_hourly
      
      result = weather_data[:hourly].find do |forecast|
        forecast[:dt] = arrival_time
      end

      arrival_temperature = result[:temp].round
      arrival_weather = result[:weather].first[:description] 
      road_trip = RoadTrip.new(params[:origin], params[:destination], travel_time, arrival_temperature, arrival_weather)
      render json: RoadTripSerializer.new(road_trip), status: 200
    end
  end

end