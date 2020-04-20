class Api::V1::AntipodeController < ApplicationController

  def index
    coordinates = GoogleGeocodingService.get_coordinates(params[:location])
    
    conn = Faraday.new "http://amypode.herokuapp.com" do |conn|
      conn.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
    
    response = conn.get('api/v1/antipodes?') do |req|
      req.params['lat'] = coordinates[:lat]
      req.params['long'] = coordinates[:lng]
    end
    antipode_coordinates = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    antipode_location = GoogleGeocodingService.get_location(antipode_coordinates)
    antipode_weather = OpenWeatherService.get_weather_data(antipode_coordinates[:lat],antipode_coordinates[:long])
    current_temp = antipode_weather[:current][:temp]
    summary = antipode_weather[:current][:weather].first[:description]
    info = Hash.new
    info[:forecast] = { summary: antipode_weather[:current][:weather].first[:description], 
      current_temperature: current_temp }
    info[:search_location] = params[:location]
    info[:location_name] = antipode_location[:plus_code][:compound_code]
    
    antipode = Antipode.new(info)
    render json: AntipodeSerializer.new(antipode)

  end

end