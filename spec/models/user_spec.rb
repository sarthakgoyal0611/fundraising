
require 'rails_helper'
RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first name exist' do
      user = User.new(last_name: "goyal",  email: "Goyal1@gmail.com", password: "Goyal1@gmail.com").save
      expect(user).to eq(false)
    end

    it 'ensures last name exist' do
      user = User.new(first_name: "test",  email: "Goyal1@gmail.com", password: "Goyal1@gmail.com").save
      expect(user).to eq(false)
    end

    it 'ensures dob exist' do
      user = User.new(first_name: "test",last_name: "goyal",  email: "Goyal1@gmail.com", password: "Goyal1@gmail.com").save
      expect(user).to eq(false)
    end

    it 'ensures email exist' do
      user = User.new(last_name: "test", first_name: "Goyal1@gmail.com", password: "Goyal1@gmail.com").save
      expect(user).to eq(false)
    end

    it 'ensures saves successfully' do
      user = User.new(first_name: "hello", last_name: "test", dob: "2023-04-11", email: "Goyal1@gmail.com", password: "123Qw@12").save
      expect(user).to eq(true)
    end
  end
end