class AmypodeService

  def self.get_antipode_coordinates(lat,long)
    response = conn.get('api/v1/antipodes?') do |req|
      req.params['lat'] = lat
      req.params['long'] = long
    end
    JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
  end

  def self.get_antipode_weather(coordinates)
    antipode_weather = OpenWeatherService.get_weather_data(coordinates[:lat],coordinates[:long])
    current_temp = antipode_weather[:current][:temp]
    forecast = {  summary: antipode_weather[:current][:weather].first[:description], 
                  current_temperature: current_temp }
    return forecast
  end
  

  private

  def self.conn
    Faraday.new "http://amypode.herokuapp.com" do |conn|
        conn.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
  end

end