require 'spec_helper'

describe GraphsController do
  describe "permissions for the index" do
    context "when the user is an admin" do 
      let!(:current_user) { create(:user) }

      before do 
        session[:user_id] = current_user.id
      end

      it "shows the graphs" do
        get :index

        expect(response).to be_successful
      end
    end

    context "when the user is a client" do
      let!(:current_user) { create(:user_client) }

      before do 
        session[:user_id] = current_user.id
      end

      it "shows the graphs" do        
        get :index

        expect(response).to be_successful
      end
    end

    context "when the user is not a client or admin" do
      let!(:current_user) { create(:user_manager) }

      before do 
        session[:user_id] = current_user.id
      end
      
      it "should boot them from the page" do
        get :index

        expect(response).to be_redirect
      end
    end
  end
end
