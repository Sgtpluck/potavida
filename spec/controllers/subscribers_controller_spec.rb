require 'spec_helper'

describe SubscribersController do
  
 
  describe 'post "create"' do
     before do
      user = create(:user)
      session[:user_id] = user.id
    end

    let(:attributes) { {name: 'davida', email: 'davida@davida.com'} }

    it 'is a redirect' do
      post :create, subscriber: attributes
      expect(response.status).to eq 302
    end

    it 'should create a new subscriber' do
      expect { post :create, subscriber: attributes }.to change(Subscriber, :count).by(1)
    end
  end
end
