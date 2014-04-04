class UsersController < ApplicationController

  def profile
    @user = current_user
  end

  def new
    check_admin
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to profile_path(current_user.id)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
