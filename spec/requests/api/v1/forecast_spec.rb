require 'rails_helper'

describe 'Forecast' do

  it 'sends the forecast for the given location' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
  end
  
end
