class BaseController < ApplicationController
  def index
    @map = Map.find_by(is_main: true)
    map_metadata = get_map_metadata(@map.id)
    @map.metadata = JSON.parse(map_metadata)['rows']
  end
end
