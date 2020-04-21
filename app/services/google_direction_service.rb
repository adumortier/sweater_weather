class GoogleDirectionService

  extend Connectable

  def self.get_travel_time(origin, destination)
    con = conn('https://maps.googleapis.com/maps/api', name: 'key', key: ENV['GOOGLE_API_KEY'] )
    response = con.get('directions/json?') do |req|
      req.params['origin'] = origin
      req.params['destination'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)[:routes].first[:legs].first[:duration][:value]
  end

end