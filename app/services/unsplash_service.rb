class UnsplashService
  
  extend Connectable

  def self.get_image_url(location)
    con = conn('https://api.unsplash.com', name: 'client_id', key: ENV['UNSPLASH_ACCESS_KEY'] )
    response = con.get('search/photos?') do |req|
      req.params['query'] = location
      req.params['page'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first[:urls][:full]
  end

end