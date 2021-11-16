require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'can return destination weather forcast', :vcr do
    coords = { lat: 39.223074, long: -105.99923 }
    response = WeatherFacade.weather_at_eta(coords, '01:37:16')

    expect(response).to have_key(:temperature)
    expect(response).to have_key(:conditions)
  end

  it 'returns empty array if no travel_time', :vcr do
    coords = { lat: 39.223074, long: -105.99923 }
    response = WeatherFacade.weather_at_eta(coords, nil)

    expect(response).to eq({})
  end
end
