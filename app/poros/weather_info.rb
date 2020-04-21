class WeatherInfo

  attr_accessor :weather_today_general, :weather_today_details, :weather_forecast, :id

  def initialize(info, location) 
    @id = 'poro'
    @weather_today_general = WeatherTodayGeneral.new(info, location)
    @weather_today_details = WeatherTodayDetails.new(info)
    @weather_forecast = WeatherForecast.new(info)
  end

  def self.get_forecast(location)
    coordinates = GoogleGeocodingService.get_coordinates(location)
    weather_data = OpenWeatherService.get_weather_data(coordinates[:lat], coordinates[:lng])
    WeatherInfo.new(weather_data, location)
  end

  def serialize
    WeatherInfoSerializer.new(self)
  end

end