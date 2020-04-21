class OpenWeatherService

  extend Connectable

  def self.get_weather_data(latitude,longitude)
    con = conn('https://api.openweathermap.org', name: 'appid', key: ENV['OPEN_WEATHER_API_KEY'] )
    response = con.get('data/2.5/onecall?') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
      req.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end