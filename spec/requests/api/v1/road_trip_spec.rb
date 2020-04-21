require 'rails_helper'

describe 'Road Trip' do

  it 'returns road trip information for user with valid api key', :vcr do

    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password' 
    expect(response.status).to eq(201)
    resp = JSON.parse(response.body)
    api_key = resp['data']['attributes']['api_key']
  
    post "/api/v1/road_trip?origin=Denver,CO&destination=Pueblo,CO&api_key=#{api_key}"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    resp = JSON.parse(response.body)
    expect(resp['data']['attributes']['origin']).to eq('Denver,CO')
    expect(resp['data']['attributes']['destination']).to eq('Pueblo,CO')
    resp['data']['attributes'].keys.include?('travel_time')
    resp['data']['attributes'].keys.include?('arrival_temp')
    resp['data']['attributes'].keys.include?('arrival_weather')
  end

  it 'returns an error message if credentials are bad', :vcr do
   
    post "/api/v1/road_trip?origin=Denver,CO&destination=Pueblo,CO&api_key=some_non_existing_api_key"

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    resp = JSON.parse(response.body)

    expect(resp['data']['attributes']['message']).to eq('Your API key is invalid')
  end

  it 'returns an error message if query params are missing', :vcr do

    post '/api/v1/users?email=whenever@example.com&password=password&password_confirmation=password' 
    expect(response.status).to eq(201)
    resp = JSON.parse(response.body)

    api_key = resp['data']['attributes']['api_key']
   
    post "/api/v1/road_trip?destination=Pueblo,CO&api_key=#{api_key}"

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    resp = JSON.parse(response.body)

    expect(resp['data']['attributes']['message']).to eq('You have missing query parameters')
  end

end
