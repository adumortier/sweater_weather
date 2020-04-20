class GoogleDirectionService

  def self.get_travel_time(origin, destination)
    response = conn.get('directions/json?') do |req|
      req.params['origin'] = origin
      req.params['destination'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)[:routes].first[:legs].first[:duration][:value]
  end

  private

  def self.conn
    Faraday.new "https://maps.googleapis.com/maps/api" do |conn|
      conn.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end

end