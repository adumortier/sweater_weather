class GoogleGeocodingService

  extend Connectable

  def self.get_coordinates(location)
    con = conn('https://maps.googleapis.com/maps', name: 'key', key: ENV['GOOGLE_API_KEY'] )
    response = con.get('api/geocode/json?') do |req|
      req.params['address'] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first[:geometry][:location]
  end

  def self.get_location(coordinates)
    con = conn('https://maps.googleapis.com/maps', name: 'key', key: ENV['GOOGLE_API_KEY'] )
    response = con.get('api/geocode/json?') do |req|
      req.params['latlng'] = "#{coordinates[:lat]},#{coordinates[:long]}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
