class Api::V1::ForcastController < ApplicationController
  def index
    coords = MapquestFacade.lat_long(params[:location])
    render json: OpenWeatherSerializer.forcast(coords)
  end
end
