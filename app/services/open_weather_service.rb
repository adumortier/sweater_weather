class OpenWeatherService

  def self.get_weather_data(latitude,longitude)
    response = conn.get('data/2.5/onecall?') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
      req.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new "https://api.openweathermap.org" do |conn|
      conn.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
    end
  end
end