require 'rails_helper'

RSpec.describe 'background image search endpoint' do
  it 'has the correct structure', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:data)
    expect(body[:data]).to have_key(:id)
    expect(body[:data]).to have_key(:attributes)
    expect(body[:data][:attributes]).to have_key(:location)
    expect(body[:data][:attributes]).to have_key(:image_url)
    expect(body[:data][:attributes]).to have_key(:credit)
    expect(body[:data][:attributes][:credit]).to have_key(:source)
    expect(body[:data][:attributes][:credit]).to have_key(:photographer)
    expect(body[:data][:attributes][:credit]).to have_key(:photographer_portfolio)
  end

   it 'returns 400 with no params', :vcr do
     get '/api/v1/backgrounds?'

     expect(response.status).to eq(400)

     body = JSON.parse(response.body, symbolize_names: true)

     expect(body).to have_key(:data)
   end
end
