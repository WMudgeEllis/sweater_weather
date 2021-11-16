require 'rails_helper'

RSpec.describe ErrorSerializer do
  it '#password_mismatch' do
    expected = {
      errors: ['the passwords do not match']
    }
    response = ErrorSerializer.password_mismatch

    expect(response).to eq(expected)
  end

  it '#general' do
    errors = %w[1 2]
    expected = {
      errors: %w[1 2]
    }

    response = ErrorSerializer.general(errors)

    expect(response).to eq(expected)
  end
end
