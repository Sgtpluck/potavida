class PostsController < ApplicationController
  before_action :check_admin, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.user_id = params[:post][:user_id]
      redirect_to '/blog'
    else
    render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order('date DESC').page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:title, :user_id, :content, :date)
  end
end