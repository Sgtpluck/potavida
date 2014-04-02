require 'spec_helper'

describe SessionsController do
   describe 'Starting a new session' do
    let!(:user) { create(:user) }
    
    it 'should find a user' do
      get :sign_in, name: user.name, password: user.password

      expect(assigns(:user).id).to be user.id
    end

    it 'should redirect to root path' do
      get :sign_in, name: user.name, password: user.password

      expect(response).to be_redirect
    end

    it 'should create a new session' do
      get :sign_in, name: user.name, password: user.password

      expect(session[:user_id]).to_not be_nil
    end
  end

  describe 'Sign out' do
    let!(:user) { create(:user) }


    it 'should destroy a session' do
      session[:user_id] = user.id
      get :destroy

      expect(session[:user_id]).to be_nil
    end
  end

  
end