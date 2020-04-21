class RoadTrip 

  attr_reader :origin, :destination, :travel_time, :arrival_temp, :arrival_weather, :id

  def initialize(origin, destination, travel_time, arrival_temp, arrival_weather) 
    @id = 'poro'
    @origin = origin 
    @destination = destination 
    @travel_time = travel_time 
    @arrival_temp = arrival_temp
    @arrival_weather = arrival_weather
  end

  def self.get_road_trip_info(origin, destination)
    travel_time = GoogleDirectionService.get_travel_time(origin,destination)
    coordinates = GoogleGeocodingService.get_coordinates(destination)
    weather_data = OpenWeatherService.get_weather_data(coordinates[:lat], coordinates[:lng])
    arrival_time = Time.at(((Time.now.to_i + travel_time)/(60*60.0)).round*(60*60))
    arrival = get_destination_weather(weather_data, arrival_time)
    RoadTrip.new(origin, destination, travel_time, arrival[:temperature], arrival[:weather])
  end

  def self.get_destination_weather(weather_data, arrival_time)
    result = weather_data[:hourly].find do |forecast|
      forecast[:dt] = arrival_time
    end
    return { temperature: result[:temp].round, weather: result[:weather].first[:description] } 
  end

  def serialize
    RoadTripSerializer.new(self)
  end

end