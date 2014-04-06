class UsersController < ApplicationController
  before_action :check_admin, only: [:new, :create]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_show_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    unless current_user.id == params[:id]
      redirect_to user_show_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
