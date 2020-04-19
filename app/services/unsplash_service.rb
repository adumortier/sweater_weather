class UnsplashService

  def self.get_image_url(location)
    response = conn.get('search/photos?') do |req|
      req.params['query'] = location
      req.params['page'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first[:urls][:full]
  end

  private 

  def self.conn
    conn = Faraday.new "https://api.unsplash.com" do |conn|
      conn.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
    end
  end
end