require 'spec_helper'

describe PostsController do
  context "when a signed-in user is an admin" do
    before do 
      @current_user = create(:user)
      session[:user_id] = @current_user.id
    end

    describe "create" do
      context "with valid attributes" do
      let(:valid_attributes) { {title: "WATERWATER", user_id: 4, content: "And not a drop to drink", date: '04-09-2014'} }

        it "gets the new page" do
          get :new

          expect(response).to be_successful
        end

        it "creates a post" do
          post_count = Post.count
          puts valid_attributes
          post :create, post: valid_attributes
          expect(Post.count).to eq(post_count + 1)
        end

        it "successfully redirects after created" do
          post :create, post: valid_attributes
          expect(response.status).to eq 302
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
        let(:invalid_attributes) { {title: "", user_id: 2, content: "yadada", date: '04-09-2014'} }

        it "does not create a post" do
          post_count = Post.count
          post :create, post: invalid_attributes
          expect(Post.count).to eq(post_count)
        end
      end
    end

    describe 'updates a post' do
      let(:post){ create(:post) }

      it "does update" do 
        patch :update, id: post.id, post: {title: 'New Title'}
        post.reload
        expect(post.title).to eq 'New Title'
      end
    end

    describe "deletes a post" do
      let!(:post){ create(:post) }

      it "deletes the post" do
        post_count = Post.count
        delete :destroy, id: post.id 

        expect(Post.count).to eq(post_count - 1)
      end
    end
  end
      
  context "when a signed-in user is NOT admin" do
    before do 
      @current_user = create(:user_manager)
      session[:user_id] = @current_user.id
    end

    it "does NOT show the new page" do
      get :new

      expect(response).to be_redirect
    end

    it "shows the individual post" do
      post = create(:post)
      get :show, id: post.id
      expect(assigns(:post)).to eq post
    end

    it "successfully shows all the posts" do
      get :index
      expect(response).to be_successful
    end

  context "it does not allow post creation" do
    let(:valid_attributes) { {title: "Water", user_id: 4, content: "Water is the best", date: '04-09-2014'}}
    
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
