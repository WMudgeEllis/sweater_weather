class Api::V1::ForcastController < ApplicationController


  def index
    require "pry"; binding.pry
    coords = MapquestFacade.lat_long(params[:location])
  end
end
