require 'rails_helper'

describe 'Forecast' do

  it 'sends the forecast for the given location', :vcr do

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:attributes].keys.include?(:weather_today_general)).to eq(true)
    expect(result[:data][:attributes].keys.include?(:weather_today_details)).to eq(true)
    expect(result[:data][:attributes].keys.include?(:weather_forecast)).to eq(true)
  end

end
