class WeatherInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :weather_today_general, :weather_today_details, :weather_forecast
end