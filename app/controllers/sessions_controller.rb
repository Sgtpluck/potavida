class SessionsController < ApplicationController
  skip_authorization_check [:sign_in]

  def new
  end

  def sign_in
    @user = User.find_by_name(params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end