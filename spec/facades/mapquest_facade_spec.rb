require "rails_helper"

RSpec.describe MapquestFacade, :vcr do
  it 'returns lat and long' do
    result = MapquestFacade.lat_long('denver,co')

    expect(result[:lat]).to eq(39.738453)
    expect(result[:long]).to eq(-104.984853)
  end
end
