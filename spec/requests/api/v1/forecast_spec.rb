require 'rails_helper'

describe 'Forecast' do

  it 'sends the forecast for the given location', :vcr do

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    result = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(result[:data][:attributes].keys.include?(:weather_today_general)).to eq(true)
    expect(result[:data][:attributes].keys.include?(:weather_today_details)).to eq(true)
    expect(result[:data][:attributes].keys.include?(:weather_forecast)).to eq(true)
  end

  it 'sends an error is params are missing', :vcr do

    get '/api/v1/forecast?location='
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    resp = JSON.parse(response.body)
    expect(resp['data']['attributes']['message']).to eq('You have missing query parameters')
  end

end
