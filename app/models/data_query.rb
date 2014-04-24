class DataQuery
  require 'cgi'


  def get_map_data
    HTTParty.get("http://ec2-54-187-74-129.us-west-2.compute.amazonaws.com/map_query")
  end

  def get_bar_data
    HTTParty.get("http://ec2-54-187-74-129.us-west-2.compute.amazonaws.com/bar_query")
  end

  def get_batt_data
    HTTParty.get("http://ec2-54-187-74-129.us-west-2.compute.amazonaws.com/batt_query")
  end

  def get_histo_cycle
    HTTParty.get("http://ec2-54-187-74-129.us-west-2.compute.amazonaws.com/histo_cycle")
  end

  def get_hist_date(params)
    HTTParty.get("http://localhost:4000/histo_query?beginning_date=#{CGI.escape params[:beginning_date]}&ending_date=#{CGI.escape params[:ending_date]}")
    #HTTParty.get("http://ec2-54-187-74-129.us-west-2.compute.amazonaws.com/histo_query?beginning_date=#{CGI.escape params[:beginning_date]}&ending_date=#{CGI.escape params[:ending_date]}")
  end
end
