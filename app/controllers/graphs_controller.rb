class GraphsController < ApplicationController
  before_action :check_permissions, only: [:index]
  respond_to :json
  layout 'user'

  def index
  end

  def histogram
    respond_with @histo_data = DataQuery.new().get_histo_cycle
  end

  def bar
    respond_with @bar_data = DataQuery.new().get_bar_data
  end

  def map
    respond_with @map_data= DataQuery.new().get_map_data
  end

  def batt
    respond_with @batt_data = DataQuery.new().get_batt_data
  end
  
  def date_range
    respond_with @hist_data.to_json = DataQuery.new().get_hist_date(params)
  end

private

  def check_permissions
    unless @current_user.try(:role) == "Admin" || @current_user.try(:role) == "Client"
      redirect_to root_path
      flash[:notice] = "You don't have permission to view this page."
    end
    return true
  end

end
