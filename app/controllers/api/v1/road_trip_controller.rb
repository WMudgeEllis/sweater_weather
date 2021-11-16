class Api::V1::RoadTripController < ApplicationController
  before_action :validate_key, :check_params

  def create
    road_trip = RoadTripFacade.get_road_trip(params[:origin], params[:destination])
    render json: RoadTripSerializer.road_trip(road_trip)
  end

  private

  def validate_key
    key = ApiKey.find_by(key: params[:api_key])
    render json: { data: 'invalid api key' }, status: 401 if key.nil?
  end

  def check_params
    render json: { data: 'missing location' }, status: 400 if params_nil_or_empty?
  end

  def params_nil_or_empty?
    if params[:origin].nil? || params[:destination].nil?
      true
    elsif params[:origin].empty? || params[:destination].empty?
      true
    else
      false
    end
  end
end
