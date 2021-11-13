require "rails_helper"

RSpec.describe Background do
  it 'exists and has attributes' do
    data = {
        "urls": {
            "full": "https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU0MjV8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM2ODM3MTc1&ixlib=rb-1.2.1&q=85",
        },
        "user": {
            "name": "Andrew Coop",
            "portfolio_url": '/example_url/',
        },
    }
    credit = {
      photographer: 'Andrew Coop',
      photographer_portfolio: '/example_url/'
    }

    background = Background.new(data)

    expect(background.image_url).to eq("https://images.unsplash.com/photo-1602800458591-eddda28a498b?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU0MjV8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjM2ODM3MTc1&ixlib=rb-1.2.1&q=85")
    expect(background.credit).to eq(credit)
  end
end
