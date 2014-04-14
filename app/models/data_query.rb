class DataQuery

  def get_map_data
    HTTParty.get("http://ec2-54-187-74-129.us-west-2.compute.amazonaws.com/map_query")
  end
end