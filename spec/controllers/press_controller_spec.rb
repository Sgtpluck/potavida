require 'spec_helper'

describe PressController do
  context "when a signed-in user is an admin" do
    before do 
      @current_user = create(:user)
      session[:user_id] = @current_user.id
    end

    describe "create" do
      context "with valid attributes" do
      let(:valid_attributes) { { title: "WATERWATER", url: 'http://www.whatever.com', pubdate: Date.today } }
        
        it "gets 'new'" do
          get :new

          expect(response).to be_successful
        end

        it "creates a media posting" do
          press_count = Press.count
          post :create, press: valid_attributes
          
          expect(Press.count).to eq(press_count + 1)
        end

        it "successfully redirects after created" do
          post :create, post: valid_attributes
          expect(response.status).to eq 302
        end

      end
    end
  end
end
