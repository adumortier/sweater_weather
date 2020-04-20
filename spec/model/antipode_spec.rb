require 'rails_helper'

RSpec.describe Background do

  describe 'attributes' do

    it 'has a forecast, search_location and location_name attributes' do

      info = {  :forecast => {:summary=>'clear sky', :current_temperature=>53.58},
                :search_location => 'Hong-Kong',
                :location_name => 'M5J9+7P Cerrillos, Jujuy, Argentina'}

      antipode = Antipode.new(info)

      expect(antipode).to have_attributes(:search_location => 'Hong-Kong')
      expect(antipode).to have_attributes(:location_name => 'M5J9+7P Cerrillos, Jujuy, Argentina')
      expect(antipode).to have_attributes(:forecast => {:summary=>'clear sky', :current_temperature=>'53.58'})

    end
  end
end