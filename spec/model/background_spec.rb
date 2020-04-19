require 'rails_helper'

RSpec.describe Background do

  describe "attributes" do
    it "has a url and id attribute" do
      background = Background.new('http://google.com')
      expect(background).to have_attributes(:id => "poro", :url => 'http://google.com')
    end
  end
end