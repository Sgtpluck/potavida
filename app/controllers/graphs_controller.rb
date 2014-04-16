class GraphsController < ApplicationController
  before_action :check_permissions, only: [:index]
  layout 'user'

  def index
  end

  def histogram
    @histo_data = DataQuery.new().get_histo_cycle
    respond_to do |format|
      format.json {  render json: @histo_data }
      format.html { redirect_to graphs_path }
    end
  end

  def bar
    @bar_data = DataQuery.new().get_bar_data
    respond_to do |format|
      format.json { render json: @bar_data }
      format.html { redirect_to graphs_path }
    end
  end

  def map
    @map_data= DataQuery.new().get_map_data
    respond_to do |format|
      format.json { render json: @map_data }
      format.html { redirect_to graphs_path }
    end
  end

  def batt
    @batt_data = DataQuery.new().get_batt_data
    respond_to do |format|
      format.json { render json: @batt_data }
      format.html { redirect_to graphs_path }
    end
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
