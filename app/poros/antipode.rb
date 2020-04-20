class Antipode

  attr_reader :location_name, :forecast, :search_location, :location_name, :id

  def initialize(info)
    @id = 'null'
    @location_name = info[:location_name]
    @forecast = {summary: info[:forecast][:summary], current_temperature: info[:forecast][:current_temperature].to_s} 
    @search_location = info[:search_location]
    @location_name = info[:location_name]
  end

end