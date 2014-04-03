require 'spec_helper'

describe "the signin process" do
 let(:user) { create(:user) }

  it "signs me in", :js => true do
    visit root_path
    click_link 'Sign In'
    within("#sign_in_here") do
      fill_in 'name', :with => "#{user.name}"
      fill_in 'password', :with => "#{user.password}"
      click_button 'Sign in'
    end
    expect(page).to have_content 'Sign Out'
    expect(page).to have_content 'Profile'
  end
end