require 'rails_helper'

describe 'Users' do

  it 'creates a user if query params are valid', :vcr do

    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
    expect(response).to be_successful
    expect(response.status).to eq(201)
    resp = JSON.parse(response.body)

    expect(resp['data']['attributes']['email']).to_not be_empty
    expect(resp['data']['attributes']['api_key']).to_not be_empty
  end

  it 'returns an error message if query params were invalid' do
   
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password' 

    post '/api/v1/users?email=whatever@example.com&password=fakepassword&password_confirmation=fakepassword'
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    resp = JSON.parse(response.body)

    expect(resp['data']['attributes']['message']).to eq('credentials do not match')
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=fakepassword'
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    resp = JSON.parse(response.body)
    expect(resp['data']['attributes']['message']).to eq('password and confirmation do not match')
  end

end
