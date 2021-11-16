require 'rails_helper'

RSpec.describe RoadTrip do
  it 'can exist and have attributes' do
    data = {
      start_city: 'Denver,CO',
      end_city: 'Boulder,CO',
      travel_time: '32 min',
      weather_at_eta: {
        temperature: 55.5,
        conditions: 'has weather'
      }
    }

    trip = RoadTrip.new(data)

    expect(trip.start_city).to eq(data[:start_city])
    expect(trip.end_city).to eq(data[:end_city])
    expect(trip.travel_time).to eq(data[:travel_time])
    expect(trip.weather_at_eta).to eq(data[:weather_at_eta])
  end

  it 'returns impossible when travel_time is nil' do
    data = {
      start_city: 'Denver,CO',
      end_city: 'Boulder,CO',
      weather_at_eta: {
        temperature: 55.5,
        conditions: 'has weather'
      }
    }

    trip = RoadTrip.new(data)

    expect(trip.travel_time).to eq('impossible')
  end
end
