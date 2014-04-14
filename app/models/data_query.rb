class DataQuery

  def get_map_data
    HTTParty.get('http://localhost:4000/map_query')
  end
end