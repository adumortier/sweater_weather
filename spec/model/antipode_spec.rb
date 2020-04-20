require 'rails_helper'

RSpec.describe Background do

  describe 'attributes' do

    it 'has a forecast, search_location and location_name attributes' do

      info = {  :forecast => {:summary=>'clear sky', :current_temperature=>53.58},
                :search_location => 'Hong-Kong',
                :location_name => 'M5J9+7P Cerrillos, Jujuy, Argentina'}

      antipode = Antipode.new(info)

      expect(antipode).to have_attributes(:search_location => 'Hong-Kong')
      expect(antipode).to have_attributes(:location_name => 'Jujuy, Argentina')
      expect(antipode).to have_attributes(:forecast => {:summary=>'clear sky', :current_temperature=>'53.58'})
    end

  end

  describe 'methods' do

    it 'returns a weather forecast for the antipode location', :vcr do
      coordinates = {:lat=>-22.3193039, :long=>-65.8306389}
      weather_summary = Antipode.weather_summary(coordinates)
      expect(weather_summary[:summary]).to_not be_empty
      expect(weather_summary.keys.include?(:current_temperature))
    end

  end
end