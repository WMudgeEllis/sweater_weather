require 'rails_helper'

RSpec.describe OpenWeatherSerializer do
  it 'can serialize the forcast', :vcr do
    coords = {
      lat: 39.738453,
      long: -104.984853
    }

    forcast = OpenWeatherSerializer.forcast(coords)
    # TODO: test test test
  end
end
