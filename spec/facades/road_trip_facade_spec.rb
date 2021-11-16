require "rails_helper"


RSpec.describe RoadTripFacade do

  it 'can make a roadtrip', :vcr do
    trip = RoadTripFacade.get_road_trip('denver,co', 'fairplay,co')

    expect(trip).to be_a(RoadTrip)
    expect(trip.start_city).to eq('denver,co')
    expect(trip.end_city).to eq('fairplay,co')
    expect(trip.travel_time).to eq('01:37:16')
    expect(trip.weather_at_eta).to eq({conditions: "broken clouds", temperature: 44.89})
  end
end
