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

end