class BaseController < ApplicationController
  def index
    @map = Map.find_by(is_main: true)

    # pass map object to javascript through gon
    gon.push({map: @map})

    @map.metadata = get_map_metadata(@map.id)
  end
end
