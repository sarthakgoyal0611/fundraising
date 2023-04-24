
require 'rails_helper'
RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first name' do
      user = User.new(last_name: "test",  email: "test@gmail.com", password: "Test1@gmail.com").save
      expect(user).to eq(false)
    end

    it 'ensures last name' do
      user = User.new(first_name: "test",  email: "test@gmail.com", password: "Test1@gmail.com").save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(last_name: "test", first_name: "test@gmail.com", password: "Test1@gmail.com").save
      expect(user).to eq(false)
    end

    it 'ensures saves successfully' do
      user = User.new(first_name: "hello", last_name: "test", dob: "2023-04-11", email: "Test1@gmail.com", password: "123Qw@12").save
      expect(user).to eq(true)
    end
  end
end