require "rails_helper"


RSpec.describe 'activities endpoint' do


  it 'can return activities', :vcr do
     get '/api/v1/activities?destination=chicago,il'

     expect(response).to be_successful

     body = JSON.parse(response.body, symbolize_names: true)

     expect(body).to have_key(:data)
     expect(body[:data]).to have_key(:id)
     expect(body[:data]).to have_key(:type)
     expect(body[:data]).to have_key(:attributes)
     expect(body[:data][:attributes]).to have_key(:destination)
     expect(body[:data][:attributes]).to have_key(:forcast)

     expect(body[:data][:attributes][:forcast]).to have_key(:summary)
     expect(body[:data][:attributes][:forcast]).to have_key(:temperature)

     expect(body[:data][:attributes]).to have_key(:activities)
     expect(body[:data][:attributes][:activities]).to be_a(Array)
     expect(body[:data][:attributes][:activities].length).to eq(2)

     expect(body[:data][:attributes][:activities][0]).to have_key(:title)
     expect(body[:data][:attributes][:activities][0]).to have_key(:type)
     expect(body[:data][:attributes][:activities][0]).to have_key(:participants)
     expect(body[:data][:attributes][:activities][0]).to have_key(:price)

  end
end
