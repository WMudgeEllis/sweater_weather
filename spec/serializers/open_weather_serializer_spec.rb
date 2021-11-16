require 'rails_helper'

RSpec.describe OpenWeatherSerializer do
  it 'can serialize the forcast', :vcr do
    coords = {
      lat: 39.738453,
      long: -104.984853
    }
    forcast = OpenWeatherSerializer.forcast(coords)

    expect(forcast[:data]).to be_a(Hash)
    expect(forcast[:data][:id]).to eq(nil)
    expect(forcast[:data][:type]).to eq('forecast')
    expect(forcast[:data][:attributes]).to be_a(Hash)
    expect(forcast[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(forcast[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(forcast[:data][:attributes][:daily_weather].length).to eq(5)
    expect(forcast[:data][:attributes][:hourly_weather]).to be_a(Array)
    expect(forcast[:data][:attributes][:hourly_weather].length).to eq(8)
  end
end
