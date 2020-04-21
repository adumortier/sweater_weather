require 'rails_helper'

RSpec.describe WeatherTodayDetails do 
  
  before(:each) do
    @info = eval File.read('spec/fixtures/weather_data.rb')
    @weather_info = WeatherTodayDetails.new(@info)
  end

  describe "methods" do
    
    it ".format_time" do
      expect(@weather_info.format_time(1587304800)).to eq('8:00 AM')
    end

    it ".convert_to_miles" do
      expect(@weather_info.convert_to_miles(1602)).to eq(1)
    end
  end
  
end
