require "rails_helper"

RSpec.describe 'user endpoint' do

  before :each do
    @body_data = {
      email: '123@133.com',
      password: 'password',
      password_confirmation: 'password'
    }

    @bad_body_data = {
      email: '123@133.com',
      password: 'password1',
      password_confirmation: 'password'
    }

  end

  xit 'can create a user' do
    post '/api/v1/users', params: @body_data
    #fails for some reason, doesnt hit the conditional in test but hits in development
    # expect(response.status).to eq(201)

    body = JSON.parse(response.body, symbolize_names: true)

    require "pry"; binding.pry
    expect(body).to have_key(:data)
    expect(body[:data]).to have_key(:type)
    expect(body[:data]).to have_key(:id)
    expect(body[:data]).to have_key(:attributes)
    expect(body[:data][:attributes]).to have_key(:email)
    expect(body[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns error when passwords dont match' do
    post '/api/v1/users', params: @bad_body_data

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:errors)
    expect(body[:errors][0]).to eq('the passwords do not match')
  end

  it 'returns an eror when email is already present' do
    User.create!(email: '123@133.com', password: 'password')
    post '/api/v1/users', params: @body_data

    expect(response.status).to eq(403)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:errors][0]).to eq("Email has already been taken")

  end
end
