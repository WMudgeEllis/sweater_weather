class Api::V1::ActivitiesController < ApplicationController
  
  def index
    coords = MapquestFacade.lat_long(params[:destination])
    forcast = OpenWeatherSerializer.forcast(coords)[:data]
    activities = ActivityFacade.activities(forcast)
    render json: ActivitySerializer.render_activities(activities, forcast, params[:destination])
  end
end
