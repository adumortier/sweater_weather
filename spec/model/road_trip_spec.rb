require 'rails_helper'

RSpec.describe RoadTrip do

  describe "attributes" do

    it "has a road trip info" do
      road_trip = RoadTrip.new('Denver, CO', 'Pueblo,CO', '2 hrs', 56, 'mostly cloudy')
      expect(road_trip).to be_a_kind_of(RoadTrip)
      expect(road_trip).to have_attributes( :id => "poro", 
                                        :origin => 'Denver, CO', 
                                        :destination => 'Pueblo,CO',
                                        :travel_time => '2 hrs',
                                        :arrival_temp => 56,
                                        :arrival_weather => 'mostly cloudy'
                                      )
    end

  end

  describe 'methods' do

    it "#get_road_trip_info", :vcr do
      road_trip = RoadTrip.get_road_trip_info('Denver, CO', 'Pueblo,CO')
      expect(road_trip).to be_a_kind_of(RoadTrip)
    end

  end

end
