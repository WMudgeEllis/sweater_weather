require "rails_helper"


RSpec.describe MapquestService do

  it 'can retrieve location with city/state', :vcr do
    response = MapquestService.location_info('denver,co')
    body = JSON.parse(response.body, symbolize_names: true)

    expect(body).to be_a(Hash)
    expect(body).to have_key(:info)
    expect(body).to have_key(:results)
    expect(body[:results][0][:locations][0]).to have_key(:latLng)
    expect(body[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(body[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
    expect(body[:results][0][:locations][0][:latLng]).to have_key(:lng)
    expect(body[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
  end
end
