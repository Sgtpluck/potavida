class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  private 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def check_admin
    unless @current_user.role == "admin"
      redirect_to root_path
      flash[:notice] = "You have to be an admin to do that."
    end
  end
  helper_method :check_admin

end
