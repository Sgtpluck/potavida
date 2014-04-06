require 'spec_helper'

describe UsersController do
  let!(:user) { create(:user) }
  
  describe 'show page' do
    it 'should be successful for a logged-in user' do
      get :show, id: user.id

      expect(response).to be_successful
    end
  end

  describe 'get "new"' do
    it 'should allow only an admin to access' do
      session[:user_id] = user.id
      user.update(role: 'client')
      get :new

      expect(response).to be_redirect
    end
  end

  it 'should create a new user' do
      session[:user_id] = user.id
      get :new
      post 'create', { user:    { name: 'Blake',
                                email: 'blake@blake.com',
                                password: 'password',
                                password_confirmation: 'password',
                                role: 'client' } }
      expect(response).to be_redirect
    end

    it 'should increase the Monster count by 1' do
      session[:user_id] = user.id
      get :new
      
      expect { post 'create', { user:    { name: 'Blake',
                                email: 'blake@blake.com',
                                password: 'password',
                                password_confirmation: 'password',
                                role: 'client' } }
                }.to change(User, :count).by(1)
    end
end
