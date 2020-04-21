require 'rails_helper'

RSpec.describe Error do

  describe "attributes" do

    it "has a message" do
      error = Error.new('this is an error')
      expect(error).to be_a_kind_of(Error)
      expect(error).to have_attributes(:id => "poro", :message => 'this is an error')
    end
  end
  
end