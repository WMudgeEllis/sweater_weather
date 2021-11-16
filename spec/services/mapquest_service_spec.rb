require "rails_helper"


RSpec.describe MapquestService do

  it 'can retrieve location with city/state', :vcr do
    response = MapquestService.location_info('denver,co')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:info)
    expect(response).to have_key(:results)
    expect(response[:results][0][:locations][0]).to have_key(:latLng)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(response[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lng)
    expect(response[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
  end

  it 'can get route information', :vcr do
    response = MapquestService.route('denver,co', 'fairplay,co')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to have_key(:formattedTime)
  end
end
