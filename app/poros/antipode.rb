class Antipode

  attr_reader :location_name, :forecast, :search_location, :location_name, :id

  def initialize(info)
    @id = 'null'
    @location_name = info[:location_name].split(',')[1..-1].map {|place| place.strip}.join(', ')
    @forecast = {summary: info[:forecast][:summary], current_temperature: info[:forecast][:current_temperature].to_s} 
    @search_location = info[:search_location]
  end

  def self.weather_summary(coordinates)
    antipode_weather = OpenWeatherService.get_weather_data(coordinates[:lat],coordinates[:long])
    current_temp = antipode_weather[:current][:temp]
    return {  summary: antipode_weather[:current][:weather].first[:description], 
              current_temperature: current_temp.round }
  end

  def self.get_info(location)
    current_coordinates = GoogleGeocodingService.get_coordinates(location)
    antipode_coordinates = AmypodeService.get_antipode_coordinates(current_coordinates[:lat],current_coordinates[:lng])
    antipode_location = GoogleGeocodingService.get_location(antipode_coordinates)
    antipode_weather = Antipode.weather_summary(antipode_coordinates)
    info = {  forecast: antipode_weather, 
              search_location: location, 
              location_name: antipode_location[:plus_code][:compound_code]
            }
    Antipode.new(info)
  end

  def serialize
    AntipodeSerializer.new(self)
  end
  
end