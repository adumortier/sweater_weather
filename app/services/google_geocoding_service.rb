class GoogleGeocodingService

  def self.get_coordinates(location)
    response = conn.get('api/geocode/json?') do |req|
      req.params['address'] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first[:geometry][:location]
  end

  def self.get_location(coordinates)
    response = conn.get('api/geocode/json?') do |req|
      req.params['latlng'] = "#{coordinates[:lat]},#{coordinates[:long]}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new "https://maps.googleapis.com/maps" do |conn|
      conn.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end

end
