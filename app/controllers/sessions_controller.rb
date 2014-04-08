class SessionsController < ApplicationController
  layout 'welcome'
  def new
  end

  def sign_in
    @user = User.find_by_name(params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    end
    respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
  end

end