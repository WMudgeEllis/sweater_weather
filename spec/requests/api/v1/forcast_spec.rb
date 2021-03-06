require 'rails_helper'

RSpec.describe 'forcast response' do
  it 'can have top level structure', :vcr do
    get '/api/v1/forcast?location=denver,co'

    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:data)
    expect(body[:data]).to have_key(:id)
    expect(body[:data][:id]).to eq(nil)

    expect(body[:data]).to have_key(:type)
    expect(body[:data][:type]).to eq('forecast')

    expect(body[:data]).to have_key(:attributes)
    expect(body[:data][:attributes]).to be_a(Hash)

    expect(body[:data][:attributes]).to have_key(:current_weather)
    expect(body[:data][:attributes][:current_weather]).to be_a(Hash)

    expect(body[:data][:attributes]).to have_key(:daily_weather)
    expect(body[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(body[:data][:attributes][:daily_weather].length).to eq(5)

    expect(body[:data][:attributes]).to have_key(:hourly_weather)
    expect(body[:data][:attributes][:hourly_weather]).to be_a(Array)
    expect(body[:data][:attributes][:hourly_weather].length).to eq(8)
  end

  it 'can have current weather structure', :vcr do
    get '/api/v1/forcast?location=denver,co'

    body = JSON.parse(response.body, symbolize_names: true)

    current_weather = body[:data][:attributes][:current_weather]

    expect(current_weather).to have_key(:datetime)
    expect(current_weather[:datetime]).to be_a(String)

    expect(current_weather).to have_key(:sunrise)
    expect(current_weather[:sunrise]).to be_a(String)

    expect(current_weather).to have_key(:sunset)
    expect(current_weather[:sunset]).to be_a(String)

    expect(current_weather).to have_key(:temperature)
    expect(current_weather[:temperature]).to be_a(Float)

    expect(current_weather).to have_key(:feels_like)
    expect(current_weather[:feels_like]).to be_a(Float)

    expect(current_weather).to have_key(:humidity)
    expect(current_weather[:humidity]).to be_a(Integer)

    expect(current_weather).to have_key(:uvi)
    expect(current_weather[:uvi]).to be_a(Float)

    expect(current_weather).to have_key(:visibility)
    expect(current_weather[:visibility]).to be_a(Integer)

    # the first ???description??? field from the weather data as given by OpenWeather
    expect(current_weather).to have_key(:conditions)
    expect(current_weather[:conditions]).to be_a(String)

    expect(current_weather).to have_key(:icon)
    expect(current_weather[:icon]).to be_a(String)
  end

  it 'can have daily weather structure', :vcr do
    get '/api/v1/forcast?location=denver,co'

    body = JSON.parse(response.body, symbolize_names: true)

    daily_weather = body[:data][:attributes][:daily_weather][0]

    expect(daily_weather).to have_key(:date)
    expect(daily_weather[:date]).to be_a(String)

    expect(daily_weather).to have_key(:sunrise)
    expect(daily_weather[:sunrise]).to be_a(String)

    expect(daily_weather).to have_key(:sunset)
    expect(daily_weather[:sunset]).to be_a(String)

    expect(daily_weather).to have_key(:max_temp)
    expect(daily_weather[:max_temp]).to be_a(Float)

    expect(daily_weather).to have_key(:min_temp)
    expect(daily_weather[:min_temp]).to be_a(Float)

    expect(daily_weather).to have_key(:conditions)
    expect(daily_weather[:conditions]).to be_a(String)

    expect(daily_weather).to have_key(:icon)
    expect(daily_weather[:icon]).to be_a(String)
  end

  it 'can have hourly weather structure', :vcr do
    get '/api/v1/forcast?location=denver,co'

    body = JSON.parse(response.body, symbolize_names: true)

    hourly_weather = body[:data][:attributes][:hourly_weather][0]

    expect(hourly_weather).to have_key(:time)
    expect(hourly_weather[:time]).to be_a(String)

    expect(hourly_weather).to have_key(:temperature)
    expect(hourly_weather[:temperature]).to be_a(Float)

    expect(hourly_weather).to have_key(:conditions)
    expect(hourly_weather[:conditions]).to be_a(String)

    expect(hourly_weather).to have_key(:icon)
    expect(hourly_weather[:icon]).to be_a(String)
  end

  it 'returns 400 with no params' do
    get '/api/v1/forcast?'

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to have_key(:data)
  end
end
