require 'spec_helper'

describe PostsController do
  context "when a signed-in user is an admin" do
    before do 
      @current_user = create(:user)
      session[:user_id] = @current_user.id
    end

    describe "create" do
      context "with valid attributes" do
      let(:valid_attributes) { {title: "WATERWATER", user_id: 2, content: "And not a drop to drink"} }

        it "successfully redirects after created" do
          post :create, post: valid_attributes
          expect(response.status).to eq 302
        end

        it "creates a post" do
          post_count = Post.count
          post :create, post: valid_attributes
          expect(Post.count).to eq(post_count + 1)
        end

        # it "sends an email" do
        #   post :create, post: valid_attributes
        #   expect(maybe the name of the job?).to maybe send?
        # end

        it "adds current_user as author" do
          post :create, post: valid_attributes
          expect(assigns(:post).user_id).to eq(@current_user.id)
        end
      end

      context "without valid attributes" do
        let(:invalid_attributes) { {title: "", user_id: 2, content: "yadada"} }

        it "does not create a post" do
          post_count = Post.count
          post :create, post: invalid_attributes
          expect(Post.count).to eq(post_count)
        end
      end
    end
  end
      
  context "when a signed-in user is NOT admin" do
    before do 
      @current_user = create(:user_field)
      session[:user_id] = @current_user.id
    end

    
  context "it does not allow post creation" do
    let(:valid_attributes) { {title: "Water", user_id: 4, content: "Water is the best"}}
    
      it "does not create a post" do
        post_count = Post.count
        post :create, post: valid_attributes
        expect(Post.count).to eq(post_count)
      end

      it "redirects if not admin" do
        get :new
        expect(response.status).to be 302
      end

      it "flashes a notice" do
        get :new
        expect(flash[:notice]).to eq("You have to be an admin to do that.")
      end
    end
  end
end
