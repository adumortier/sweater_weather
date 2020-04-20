class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location_name, :forecast, :search_location, :location_name
end