class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to '/blog'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :content)
  end
end