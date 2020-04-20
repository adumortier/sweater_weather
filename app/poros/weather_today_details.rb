class WeatherTodayDetails

  def initialize(info)
    @feels_like = info[:current][:feels_like].round
    @humidity_percent = info[:current][:humidity]
    @visibility_miles = convert_to_miles(info[:current][:visibility])
    @description = info[:current][:weather].first[:description]
    @icon = "http://openweathermap.org/img/wn/" + info[:current][:weather].first[:icon] + "@2x.png"
    @sunrise_time = format_time(info[:current][:sunrise])
    @sunset_time = format_time(info[:current][:sunset])
    @uv_index = info[:current][:uvi].round
  end

  def format_time(time)
    Time.at(time).strftime("%-I:%M %p")
  end

  def convert_to_miles(meter)
    meter/1600.0.round
  end

end