require 'rails_helper'

feature 'Register' do
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
end
