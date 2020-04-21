class WeatherTodayGeneral

  def initialize(info, location)
    @location = format_location(location)
    @time = format_time(info[:current][:dt])
    @current_temperature = info[:current][:temp].round
    @description = info[:current][:weather].first[:description]
    @temperature_high = info[:daily].first[:temp][:min].round
    @temperature_low = info[:daily].first[:temp][:max].round
    @icon = "http://openweathermap.org/img/wn/" + info[:current][:weather].first[:icon] + "@2x.png"
  end

  def format_time(time)
    Time.at(time).strftime("%-I:%M %p") + ', ' + Time.at(time).to_formatted_s(:long).split(',').first
  end

  def format_location(location)
    # city, state = location.split(',')
    # city.capitalize + ', ' + state.upcase
    location.capitalize
  end

end