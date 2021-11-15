require "rails_helper"

RSpec.describe ActivityService do

  it 'can get relaxation activity', :vcr do
    response = ActivityService.relaxation
    require "pry"; binding.pry
    expect(response).to have_key(:activity)
    expect(response).to have_key(:type)
    expect(response).to have_key(:participants)
    expect(response).to have_key(:price)
  end

end
