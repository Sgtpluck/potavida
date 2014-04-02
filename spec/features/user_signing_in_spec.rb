require 'spec_helper'

describe "the signin process" do
 let(:user) { create(:user) }

  it "signs me in" do
    visit root_path
    click_link 'Sign In'
    within("#sign_in") do
      fill_in 'Name', :with => "#{user.name}"
      fill_in 'Password', :with => "#{user.password}"
      click_button 'Sign in'
    end
    expect(page).to have_content 'Sign Out'
  end
end