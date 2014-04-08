class PostsController < ApplicationController
  before_action :check_admin, only: [:new, :create, :edit]
  before_action :find_post, only: [:destroy, :update, :show, :edit]
  layout 'posts'

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
  end

  def edit
  end

  def index
    @posts = Post.all.order('date DESC').page(params[:page])
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :user_id, :content, :date)
  end

  def find_post
    post_id = params[:id] || params[:post][:id]
    @post = Post.find(post_id)
  end
end