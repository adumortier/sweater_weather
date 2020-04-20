require 'rails_helper'

describe 'antipode' do

  it 'sends the antipode city along with the weather and the antipode city', :vcr do
    get '/api/v1/antipode?location=Hong-Kong'
    expect(response).to be_successful
  
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:attributes].keys.include?(:location_name)).to eq(true)
    expect(result[:data][:attributes].keys.include?(:forecast)).to eq(true)
    expect(result[:data][:attributes][:forecast].keys.include?(:summary)).to eq(true)
    expect(result[:data][:attributes][:forecast].keys.include?(:current_temperature)).to eq(true)
    expect(result[:data][:attributes].keys.include?(:search_location)).to eq(true)
    
  end
  
end
