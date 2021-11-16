require 'rails_helper'

RSpec.describe 'user login request' do
  before :each do
    user = User.create!(email: 'whatever@example.com', password: 'password')
    user.api_keys.create!(key: '1234')
    @credentials = {
      email: user.email,
      password: 'password'
    }
    @bad_credentials = {
      email: 'user.email@fake.com',
      password: 'password1'
    }
  end

  it 'successfully logs a user in' do
    post '/api/v1/sessions', params: @credentials

    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:data)
    expect(body[:data]).to have_key(:type)
    expect(body[:data]).to have_key(:id)
    expect(body[:data]).to have_key(:attributes)
    expect(body[:data][:attributes]).to have_key(:email)
    expect(body[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns 403 with bad credentials' do
    post '/api/v1/sessions', params: @bad_credentials

    expect(response.status).to eq(403)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:body]).to eq('bad credentials')
  end
end
