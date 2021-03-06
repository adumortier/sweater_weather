require 'rails_helper'

RSpec.describe WeatherTodayGeneral do 
  
  before(:each) do
    @info = eval File.read('spec/fixtures/weather_data.rb')
    @weather_info = WeatherTodayGeneral.new(@info, 'denver,co')
  end

  describe "methods" do
    
    xit ".format_time" do
      expect(@weather_info.format_time(1587304800)).to eq('8:00 AM, April 19')
    end

    it ".format_location" do
      expect(@weather_info.format_location('denver,co')).to eq('Denver,co')
    end
  end
  
end