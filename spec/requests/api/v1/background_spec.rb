require 'rails_helper'

describe 'Background' do

  it 'sends a background image for the given location', :vcr do
    get '/api/v1/background?location=denver,co'
    expect(response).to be_successful
    expect(response.status).to eq(200)
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:attributes].keys.include?(:url)).to eq(true)
  end
  
end
