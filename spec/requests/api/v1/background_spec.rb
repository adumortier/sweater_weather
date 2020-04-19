require 'rails_helper'

describe 'Background' do

  it 'sends a background image for the given location' do
    get '/api/v1/background?location=denver,co'
    expect(response).to be_successful
    require 'pry'; binding.pry
  end
  
end
