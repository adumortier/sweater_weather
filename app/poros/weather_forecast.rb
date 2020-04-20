class WeatherForecast

  attr_reader :forecast_hourly, :forecast_daily

  def initialize(info) 
    @forecast_hourly = format_hourly(info[:hourly][0..7])
    @forecast_daily = format_daily(info[:daily][0..6])
  end 

  def format_hourly(hourly_forecast)
    hourly_forecast.map do |forecast|
      { time: format_time(forecast[:dt]), 
        temperature: forecast[:temp].round, 
        icon: "http://openweathermap.org/img/wn/" + forecast[:weather].first[:icon] + "@2x.png"}
    end
  end

  def format_daily(daily_forecast)
    daily_forecast.map do |forecast|
      { day: format_day(forecast[:dt]), 
        description: forecast[:weather].first[:main], 
        precipitation_mm: format_precipitation(forecast).round, 
        high_temp: forecast[:temp][:max].round,
        low_temp: forecast[:temp][:min].round,
        icon: "http://openweathermap.org/img/wn/" + forecast[:weather].first[:icon] + "@2x.png"
      }
    end
  end

  def format_precipitation(forecast)
    if forecast[:rain]
      forecast[:rain]
    elsif forecast[:snow]
      forecast[:snow]
    else
      0
    end
  end

  def format_day(time)
    Time.at(time).strftime('%A')
  end

  def format_time(time)
    Time.at(time).strftime("%-I %p")
  end

end