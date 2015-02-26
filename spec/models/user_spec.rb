require 'rails_helper'

describe User do
  before :each do
    @user = User.create(first_name: 'Deena', last_name: 'Pilgrimm', email: 'deena@email.com', password: 'powers123')
  end

  it 'validates the presence of a first name' do
    @user.update_attributes(first_name: nil)
    expect(@user.errors.any?).to eq(true)
  end

  it 'validates the presence of a last name' do
    @user.update_attributes(last_name: nil)
    expect(@user.errors.any?).to eq(true)
  end

  it 'validates the presence of an email' do
    @user.update_attributes(email: nil)
    expect(@user.errors.any?).to eq(true)
  end

  it 'validates the presence of a password' do
    @user.update_attributes(password: nil)
    expect(@user.errors.any?).to eq(true)
  end

  it 'email must be unique' do
    user2 = User.create(first_name: 'Christian', last_name: 'Walker', email: 'deena@email.com', password: 'cwalkerpowers')
    expect(user2.errors.any?).to eq(true)
  end
end
