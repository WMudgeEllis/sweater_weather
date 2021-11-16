require 'rails_helper'

RSpec.describe UnsplashService do
  it 'can search for a background', :vcr do
    data = UnsplashService.search('denver')

    expect(data).to have_key(:results)
    expect(data[:results]).to be_a(Array)
    expect(data[:results][0]).to have_key(:urls)
    expect(data[:results][0][:urls]).to have_key(:full)
    expect(data[:results][0]).to have_key(:user)
    expect(data[:results][0][:user]).to have_key(:name)
    expect(data[:results][0][:user]).to have_key(:portfolio_url)
  end
end
