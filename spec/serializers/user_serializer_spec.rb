require 'rails_helper'

RSpec.describe UserSerializer do
  it 'returns the user structure' do
    user = User.create!(email: 'example', password: '123')
    key = user.api_keys.create!(key: SecureRandom.hex)

    response = UserSerializer.new_user(user, key)

    expect(response[:data][:id]).to eq(user.id.to_s)
    expect(response[:data][:type]).to eq('users')
    expect(response[:data][:attributes][:email]).to eq(user.email)
    expect(response[:data][:attributes][:api_key]).to eq(key.key)
  end
end
