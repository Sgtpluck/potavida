class GraphsController < ApplicationController
  before_action :check_permissions, only: [:index]

  def index
  end

private

  def check_permissions
    unless @current_user.try(:role) == "admin" || @current_user.try(:role) == "client"
      redirect_to root_path
      flash[:notice] = "You don't have permission to view this page."
    end
    return true
  end

end
