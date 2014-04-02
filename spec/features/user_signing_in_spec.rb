require 'spec_helper'

feature 'Visitor signs in' do
  scenario 'with valid email and password' do
    sign_in_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_in_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

  def sign_in_with(email, password)
    visit sign_in_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end
end