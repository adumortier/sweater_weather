require 'rails_helper'

describe 'Background' do

  it 'sends a background image for the given location', :vcr do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
    expect(response.status).to eq(200)
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:attributes].keys.include?(:url)).to eq(true)
  end

  it 'sends an error is params are missing', :vcr do

    get '/api/v1/backgrounds?location='
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    resp = JSON.parse(response.body)
    expect(resp['data']['attributes']['message']).to eq('You have missing query parameters')
  end
  
end
