require 'rails_helper'

RSpec.describe MapquestFacade, :vcr do
  it 'returns lat and long' do
    result = MapquestFacade.lat_long('denver,co')

    expect(result[:lat]).to eq(39.738453)
    expect(result[:long]).to eq(-104.984853)
  end

  it 'returns eta of route', :vcr do
    result = MapquestFacade.route_time('denver,co', 'fairplay,co')

    expect(result).to eq('01:37:16')
  end
end
