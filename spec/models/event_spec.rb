require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'ensures Title' do
    event = Event.new(description: "test12345").save
    expect(user).to eq(false)
  end
end

