class DataQuery

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
    HTTParty.get("http://localhost:4000/histo_cycle")
  end
end
