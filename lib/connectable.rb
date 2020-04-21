module Connectable

  def conn(url, api_info)
    Faraday.new url do |conn|
      conn.params[api_info[:name]] = api_info[:key]
    end
  end

end