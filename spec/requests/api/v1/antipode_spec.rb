require 'rails_helper'

describe 'antipode' do

  it 'sends the antipode city along with the weather and the antipode city', :vcr do

    get '/api/v1/antipode?location=Hong-Kong'
    expect(response).to be_successful
    expect(response.status).to eq(200)
    result = JSON.parse(response.body)
    
    expect(result['data']['attributes']['location_name']).to eq('Jujuy, Argentina')
    expect(result['data']['attributes']['search_location']).to eq('Hong-Kong')
    expect(result['data']['attributes']['forecast']['summary'].empty?).to eq(false)
    expect(result['data']['attributes']['forecast']['current_temperature'].empty?).to eq(false)
  end

end
