class UsersController < ApplicationController
  before_action :check_admin, except: [:show, :edit, :update]
  before_action :find_user, only: [:new, :edit, :update, :show, :update_user_role, :change_user_role, :index]
  layout 'user'

  def index
    @users = User.all
  end

  def show
    redirect_to users_path unless current_user.id == @user.id
  end

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    redirect_to users_path unless current_user.id == @user.id
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def change_user_role
    @user
  end

  def update_user_role
    @user.update_roles(params)
    redirect_to 'index'
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
