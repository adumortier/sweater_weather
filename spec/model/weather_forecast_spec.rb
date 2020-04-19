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

      hourly_forecast = [ {:time=>"7 AM", :temperature=>37, :icon=>"04d"},
                          {:time=>"8 AM", :temperature=>40, :icon=>"04d"},
                          {:time=>"9 AM", :temperature=>43, :icon=>"03d"},
                          {:time=>"10 AM", :temperature=>45, :icon=>"03d"},
                          {:time=>"11 AM", :temperature=>49, :icon=>"04d"},
                          {:time=>"12 PM", :temperature=>53, :icon=>"04d"},
                          {:time=>"1 PM", :temperature=>56, :icon=>"04d"},
                          {:time=>"2 PM", :temperature=>59, :icon=>"04d"}]
      
      expect(@weather_forecast.format_hourly(@info[:hourly][0..7])).to eq(hourly_forecast)
    end

    it "returns the daily forecast" do

      daily_forecast = [  {:day=>"Sunday", :description=>"Clouds", :precipitation_mm=>0, :high_temp=>60, :low_temp=>37, :icon=>"04d"},
                          {:day=>"Monday", :description=>"Clear", :precipitation_mm=>0, :high_temp=>66, :low_temp=>43, :icon=>"01d"},
                          {:day=>"Tuesday", :description=>"Rain", :precipitation_mm=>3, :high_temp=>63, :low_temp=>46, :icon=>"10d"},
                          {:day=>"Wednesday", :description=>"Clouds", :precipitation_mm=>0, :high_temp=>66, :low_temp=>49, :icon=>"03d"},
                          {:day=>"Thursday", :description=>"Rain", :precipitation_mm=>0, :high_temp=>65, :low_temp=>50, :icon=>"10d"},
                          {:day=>"Friday", :description=>"Rain", :precipitation_mm=>5, :high_temp=>55, :low_temp=>44, :icon=>"10d"},
                          {:day=>"Saturday", :description=>"Clear", :precipitation_mm=>0, :high_temp=>61, :low_temp=>42, :icon=>"01d"}]

      expect(@weather_forecast.format_daily(@info[:daily][0..6])).to eq(daily_forecast)
    end
    


  end
    


end
