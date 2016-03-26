require 'net/http'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_map_metadata(map_id)
    url = URI(Map.find(map_id).cartodb_sql_url)

    data = Hash.new
    Map::SECTORS.each do |sector|
      query_string = Map::COUNT_DATA_PER_SECTOR % sector
      data[sector] = make_request(url, query_string)[0]
    end

    return data
  end

  def make_request(url, query_string)
    query = URI.encode_www_form({q: query_string})
    url = URI("#{url}#{query}")

    response = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') do |http|
      request = Net::HTTP::Get.new url
      response = http.request(request)
    end
    return JSON.parse(response.body)['rows']
  end
end
