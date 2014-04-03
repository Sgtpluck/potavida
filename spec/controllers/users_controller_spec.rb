require 'spec_helper'

describe UsersController do
  let!(:user) { create(:user) }
  
  describe 'profile page' do
    it 'should be successful for a logged-in user' do
      get :profile, id: user.id

      expect(response).to be_successful
    end
  end

  describe 'get "new"' do
    it 'should allow only an admin to access' do
      current_user.role = "client"
      get :new

      expect(response).to be_redirect
    end
  end
end
