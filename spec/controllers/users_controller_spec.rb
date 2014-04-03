require 'spec_helper'

describe UsersController do
  let!(:user) { create(:user) }
  
  describe 'profile page' do
    it 'should be successful for a logged-in user' do
      get :profile, id: user.id

      expect(response).to be_successful
    end
  end
end
