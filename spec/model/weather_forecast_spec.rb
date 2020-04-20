require 'rails_helper'

RSpec.describe WeatherForecast do

  before(:each) do
    @info = eval File.read('spec/fixtures/weather_data.rb')
    @weather_forecast = WeatherForecast.new(@info)
  end

  describe "attributes" do
    it "attributes" do
      expect(@weather_forecast).to respond_to(:forecast_daily)
      expect(@weather_forecast).to respond_to(:forecast_hourly)
    end
  end

  describe "methods" do

    it "returns the hourly forecast" do

      hourly_forecast = [ {:time=>"7 AM", :temperature=>37, :icon=>"http://openweathermap.org/img/wn/04d@2x.png"},
                          {:time=>"8 AM", :temperature=>40, :icon=>"http://openweathermap.org/img/wn/04d@2x.png"},
                          {:time=>"9 AM", :temperature=>43, :icon=>"http://openweathermap.org/img/wn/03d@2x.png"},
                          {:time=>"10 AM", :temperature=>45, :icon=>"http://openweathermap.org/img/wn/03d@2x.png"},
                          {:time=>"11 AM", :temperature=>49, :icon=>"http://openweathermap.org/img/wn/04d@2x.png"},
                          {:time=>"12 PM", :temperature=>53, :icon=>"http://openweathermap.org/img/wn/04d@2x.png"},
                          {:time=>"1 PM", :temperature=>56, :icon=>"http://openweathermap.org/img/wn/04d@2x.png"},
                          {:time=>"2 PM", :temperature=>59, :icon=>"http://openweathermap.org/img/wn/04d@2x.png"}]
      
      expect(@weather_forecast.format_hourly(@info[:hourly][0..7])).to eq(hourly_forecast)
    end

    it "returns the daily forecast" do

      daily_forecast = [  {:day=>"Sunday", :description=>"Clouds", :precipitation_mm=>0, :high_temp=>60, :low_temp=>37, :icon=>"http://openweathermap.org/img/wn/04d@2x.png"},
                          {:day=>"Monday", :description=>"Clear", :precipitation_mm=>0, :high_temp=>66, :low_temp=>43, :icon=>"http://openweathermap.org/img/wn/01d@2x.png"},
                          {:day=>"Tuesday", :description=>"Rain", :precipitation_mm=>3, :high_temp=>63, :low_temp=>46, :icon=>"http://openweathermap.org/img/wn/10d@2x.png"},
                          {:day=>"Wednesday", :description=>"Clouds", :precipitation_mm=>0, :high_temp=>66, :low_temp=>49, :icon=>"http://openweathermap.org/img/wn/03d@2x.png"},
                          {:day=>"Thursday", :description=>"Rain", :precipitation_mm=>0, :high_temp=>65, :low_temp=>50, :icon=>"http://openweathermap.org/img/wn/10d@2x.png"},
                          {:day=>"Friday", :description=>"Rain", :precipitation_mm=>5, :high_temp=>55, :low_temp=>44, :icon=>"http://openweathermap.org/img/wn/10d@2x.png"},
                          {:day=>"Saturday", :description=>"Clear", :precipitation_mm=>0, :high_temp=>61, :low_temp=>42, :icon=>"http://openweathermap.org/img/wn/01d@2x.png"}]

      expect(@weather_forecast.format_daily(@info[:daily][0..6])).to eq(daily_forecast)
    end
    


  end
    


end
