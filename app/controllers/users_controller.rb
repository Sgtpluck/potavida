class UsersController < ApplicationController
  before_action :check_admin, only: [:new, :create]
  before_action :find_user, only: [:edit]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    redirect_to user_path unless current_user.id == params[:id].to_i
  end

  def update
    @user = User.update(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
