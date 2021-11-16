class Api::V1::ForcastController < ApplicationController
  before_action :location_param_check
  def index
    coords = MapquestFacade.lat_long(params[:location])
    render json: OpenWeatherSerializer.forcast(coords)
  end
end
