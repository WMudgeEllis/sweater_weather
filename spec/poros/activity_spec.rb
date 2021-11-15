require "rails_helper"

RSpec.describe Activity do

  it 'exists and has attributes' do
    data = {
      :activity=>"Write a list of things you are grateful for",
      :type=>"relaxation",
      :participants=>1,
      :price=>0,
      :link=>"",
      :key=>"2062010",
      :accessibility=>0
    }

    activity = Activity.new(data)

    expect(activity.title).to eq("Write a list of things you are grateful for")
    expect(activity.type).to eq('relaxation')
    expect(activity.participants).to eq(1)
    expect(activity.price).to eq(0)
  end
end
