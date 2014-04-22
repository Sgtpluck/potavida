require 'spec_helper'

describe PressController do
  
  before do 
    @current_user = create(:user)
    session[:user_id] = @current_user.id
  end

  describe 'get "index"' do
    context "when the user is not an admin" do

      it "should boot them from the page" do
        @current_user.update(role: 'Client')
        get :new

        expect(response).to be_redirect
      end
    end

    context "when the user is an admin" do
      it 'should be successful' do
        get :index

        expect(response).to be_successful
      end
    end
  end

  describe "create" do
    context "when the user is not an admin" do

      it "should boot them from the page" do
        @current_user.update(role: 'Client')
        get :new

        expect(response).to be_redirect
      end
    end

    context "with valid attributes and an admin" do
    
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
        post :create, press: valid_attributes
        expect(response.status).to eq 302
      end
    end
  end

  describe 'get "edit"' do
    let!(:press) { create(:press) }
    
    it 'should be successful' do
      get :edit, id: press.id

      expect(response).to be_successful
    end
  end

  describe 'post "update"' do
    let!(:press) { create(:press) }
    
    it 'does update' do
      patch :update, id: press.id, press: {
                                       title: 'new title' 
                                     }
      press.reload

      expect(press.title).to eq 'new title'
    end

    it "should render the edit view if the press isn't saved" do
      patch :update, id: press.id, press: {
                                       title: nil 
                                     }
      press.reload

      expect(response).to render_template(:edit)
    end
  end
end
