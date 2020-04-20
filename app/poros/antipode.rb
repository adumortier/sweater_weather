class Antipode

  attr_reader :location_name, :forecast, :search_location, :location_name, :id

  def initialize(info)
    @id = 'null'
    @location_name = info[:location_name]
    @forecast = {summary: info[:forecast][:summary], current_temperature: info[:forecast][:current_temperature].to_s} 
    @search_location = info[:search_location]
    @location_name = info[:location_name]
  end

  def self.weather_summary(coordinates)
    antipode_weather = OpenWeatherService.get_weather_data(coordinates[:lat],coordinates[:long])
    current_temp = antipode_weather[:current][:temp]
    return {  summary: antipode_weather[:current][:weather].first[:description], 
              current_temperature: current_temp.round }
  end
  
end