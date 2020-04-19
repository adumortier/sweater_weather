class WeatherInfo

  attr_accessor :weather_today_general, :weather_today_details, :weather_forecast, :id

  def initialize(info, location) 
    @id = 'poro'
    @weather_today_general = WeatherTodayGeneral.new(info, location)
    @weather_today_details = WeatherTodayDetails.new(info)
    @weather_forecast = WeatherForecast.new(info)
  end

end