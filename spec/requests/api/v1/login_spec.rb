require 'rails_helper'

describe 'Login' do

  it 'returns the api_key of a user with valid credentials', :vcr do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
    
    post '/api/v1/sessions?email=whatever@example.com&password=password'
    expect(response).to be_successful
    resp = JSON.parse(response.body)
    expect(resp['data']['attributes']['email']).to eq('whatever@example.com')
    expect(resp['data']['attributes']['api_key']).to_not be_empty
  end

  it 'returns an error message if credentials are bad' do
   
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password' 

    post '/api/v1/sessions?email=whatever@example.com&password=fakepassword'
    expect(response).to_not be_successful
    resp = JSON.parse(response.body)
    expect(resp['data']['attributes']['message']).to eq('Your email and/or password are invalid')

    post '/api/v1/sessions?email=password@example.com&password=whaever'
    expect(response).to_not be_successful
    resp = JSON.parse(response.body)
    expect(resp['data']['attributes']['message']).to eq('Your email and/or password are invalid')
  end

end
