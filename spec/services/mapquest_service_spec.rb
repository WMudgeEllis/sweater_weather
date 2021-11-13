require "rails_helper"


RSpec.describe MapquestService do

  it 'can retrieve location with city/state' do
    response = MapquestService.location_info('denver,co')
    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to be_a(Hash)
    expect(body).to have_key(:info)
    expect(body).to have_key(:results)
    expect(body[:results]).to have_key(:latlng)
    expect(body[:results][:latlng]).to have_key(:lat)
    expect(body[:results][:latlng][:lat]).to eq(39.738453)
    expect(body[:results][:latlng]).to have_key(:lng)
    expect(body[:results][:latlng][:lng]).to eq(-104.984853)
  end
end
