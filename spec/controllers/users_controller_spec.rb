require 'spec_helper'

describe UsersController do
  let!(:user) { create(:user) }

  describe 'get "index" ' do
    it 'should be successful for a logged-in admin' do
      get :index, id: user.id

      expect(response).to be_successful
    end

    it 'should redirect anyone who is not an admin' do
      user.update(role: 'manager')
      get :index, id: user.id

      expect(response).to be_redirect
    end

    it 'should have an array of users' do
      user1 = create(:user_field)
      user2 = create(:user_client)
      get :index, id: user.id

      expect(assigns(:users)).to match_array([user, user1, user2])
    end
  end
  
  describe 'get "show"' do
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

    it 'should increase the User count by 1' do
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


  describe "get 'edit'" do
    it "should redirect if the user is trying to navigate to someone else's profile page" do
      user2 = create(:user_field)
      session[:user_id] = user.id
      get :edit, id: user2.id

      expect(response).to be_redirect
    end
  end

  describe "patch 'update'" do

    it 'does update' do
      patch :update, id: user.id, user: {
                                       name: 'user' 
                                     }
      user.reload

      expect(user.name).to eq 'user'
    end

    it "should render the edit view if the user isn't saved" do
      patch :update, id: user.id, user: {
                                       name: nil 
                                     }
      user.reload

      expect(response).to render_template(:edit)
    end
  end # ends 'updating users'
end
