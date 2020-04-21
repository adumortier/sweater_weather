class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :travel_time_in_sec, :arrival_temp, :arrival_weather
end