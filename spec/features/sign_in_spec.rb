require 'rails_helper'

feature 'Sign In' do
  scenario 'User can sign in' do
    user = User.create!(
      first_name: 'Charlie',
      last_name: 'Painter',
      email: 'cp123@email.com',
      password: 'examplepassword5',
      password_confirmation: 'examplepassword5'
    )

    visit root_path
    fill_in :email, with: 'cp123@email.com'
    fill_in :password, with: 'examplepassword5'
    click_on 'Sign In'

    expect(page).to have_content('You have successfully logged in!')

    expect(user.id).to eq(session[:user_id])
    save_and_open_page

  end


end
