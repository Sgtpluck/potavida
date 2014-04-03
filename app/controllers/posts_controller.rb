class PostsController < ApplicationController
  before_action :check_admin, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      redirect_to '/blog'
    else
    render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :user_id, :content)
  end
end