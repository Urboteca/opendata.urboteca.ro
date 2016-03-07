class BaseController < ApplicationController
  def index
    @table = MapTable.new
    @table.header = "Certificate de urbanism"
  end
end
