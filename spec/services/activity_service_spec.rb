require "rails_helper"

RSpec.describe ActivityService do

  it 'can get relaxation activity', :vcr do
    response = ActivityService.relaxation

    expect(response).to have_key(:activity)
    expect(response).to have_key(:type)
    expect(response[:type]).to eq('relaxation')
    expect(response).to have_key(:participants)
    expect(response).to have_key(:price)
  end

  it 'can get recreational activity', :vcr do
    response = ActivityService.recreational

    expect(response).to have_key(:activity)
    expect(response).to have_key(:type)
    expect(response[:type]).to eq('recreational')
    expect(response).to have_key(:participants)
    expect(response).to have_key(:price)
  end

  it 'can get busywork activity', :vcr do
    response = ActivityService.busywork


    expect(response).to have_key(:activity)
    expect(response).to have_key(:type)
    expect(response[:type]).to eq('busywork')
    expect(response).to have_key(:participants)
    expect(response).to have_key(:price)
  end

  it 'can get cooking activity', :vcr do
    response = ActivityService.cooking


    expect(response).to have_key(:activity)
    expect(response).to have_key(:type)
    expect(response[:type]).to eq('cooking')
    expect(response).to have_key(:participants)
    expect(response).to have_key(:price)
  end
end
