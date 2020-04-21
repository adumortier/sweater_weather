require 'rails_helper'

RSpec.describe Background do

  describe "attributes" do
    it "has a url and id attribute" do
      background = Background.new('http://google.com')
      expect(background).to be_a_kind_of(Background)
      expect(background).to have_attributes(:id => "poro", :url => 'http://google.com')
    end
  end

  describe '#methods' do

    it '#get_image_url' do
      background = Background.get_image_url('Paris')
      expect(background).to be_a_kind_of(Background)
    end

  end
end