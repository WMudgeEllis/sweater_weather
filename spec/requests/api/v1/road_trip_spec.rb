require "rails_helper"

RSpec.describe 'road trip endpoint' do

  before :each do
    user = User.create!(email: 'blah', password: 'hunter1')
    key = user.api_keys.create!(key: 'super seekrit')
    @credentials = {
      origin: 'denver,co',
      destination: 'pueblo,co',
      api_key: key.key
    }

    @bad_key_credentials = {
      origin: 'denver,co',
      destination: 'pueblo,co',
      api_key: 'bad key'
    }

    @bad_location_credentials = {
      origin: 'denver,co',
      destination: '',
      api_key: key.key
    }

  end

  it 'can get details about a roadtrip', :vcr do
    post '/api/v1/road_trip', params: @credentials

    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:data)
    expect(body[:data]).to have_key(:id)
    expect(body[:data]).to have_key(:type)
    expect(body[:data]).to have_key(:attributes)
    expect(body[:data][:attributes]).to have_key(:start_city)
    expect(body[:data][:attributes]).to have_key(:end_city)
    expect(body[:data][:attributes]).to have_key(:travel_time)
    expect(body[:data][:attributes]).to have_key(:weather_at_eta)
    expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
  end

  it 'requires a valid api key', :vcr do
    post '/api/v1/road_trip', params: @bad_key_credentials

    expect(response.status).to eq(401)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:data)
  end


  it 'requires extant location', :vcr do
    post '/api/v1/road_trip', params: @bad_location_credentials

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:data)
    expect(body[:data]).to eq('missing location')

  end

end
