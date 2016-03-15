class BaseController < ApplicationController
  def index
    @map = Map.find_by(is_main: true)
  end
end
