class WeatherTodayDetails

  def initialize(info)

    info[:details_feels_like] = info[:current][:feels_like]
    info[:details_humidity] = info[:current][:humidity]
    info[:details_visibility] = info[:current][:visibility]
    info[:details_description] = info[:current][:weather].first[:description]
    info[:details_sunrise] = info[:current][:sunrise]
    info[:details_sunset]= info[:current][:sunset]
    info[:details_uvi] = info[:current][:uvi]
    info[:hourly] = info[:hourly][0..7]
    info[:daily] = info[:daily][0..6]

    @feels_like = info[:current][:feels_like].round
    @humidity_percent = info[:current][:humidity]
    @visibility_miles = convert_to_miles(info[:current][:visibility])
    @description = info[:current][:weather].first[:description]
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