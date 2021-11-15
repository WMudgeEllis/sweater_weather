class Api::V1::ActivitiesController < ApplicationController


  def index
    coords = MapquestFacade.lat_long(params[:destination])
    forcast = OpenWeatherSerializer.forcast(coords)
    activities = ActivityFacade.activities(forcast)
    render json: ActivitySerializer.render_activities(activities)
  end

end
