require 'rails_helper'

feature 'Sign Up' do
  scenario 'User can register for access to Lightning talk app' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'First name', with: 'Charles'
    fill_in 'Last name', with: 'Painter'
    fill_in 'Email', with: 'cpainter@email.com'
    fill_in 'Password', with: 'exampleP@$$word2025'
    fill_in 'Password confirmation', with: 'exampleP@$$word2025'
    click_on 'Sign Up'
    expect(page).to have_content('You have successfully signed up!')
    expect(page).to have_content('Lightning Talks')
    expect(page).to have_no_content('Sign Up')
  end

  scenario 'User needs a first name, last name, email, password, password confirmation' do
    visit root_path
    click_on 'Sign Up'
    click_on 'Sign Up'
    expect(page).to have_no_content('You have successfully signed in!')
    expect(page).to have_content('First name can\'t be blank')
    expect(page).to have_content('Last name can\'t be blank')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
  end

  # scenario 'Email must be unique' do
  #   User.create!(
  #     first_name: 'Champion',
  #     last_name: 'Painter',
  #     email: 'cpainter@email.com',
  #     password: 'championpassword5',
  #     password_confirmation: 'championpassword5'
  #   )
  #
  #   visit root_path
  #   click_on 'Sign Up'
  #
  #   fill_in 'First name', with: 'Charles'
  #   fill_in 'Last name', with: 'Painter'
  #   fill_in 'Email', with: 'cpainter@email.com'
  #   fill_in 'Password', with: 'exampleP@$$word2025'
  #   fill_in 'Password confirmation', with: 'exampleP@$$word2025'
  #
  #   expect(page).to have_no_content('You have successfully signed in!')
  #   save_and_open_page
  #   expect(page).to have_content('Email has already been taken')
  #
  # end
end
