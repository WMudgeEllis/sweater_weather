class ApplicationController < ActionController::API


  private

  def location_param_check
    if params[:location].nil? || params[:location].empty?
      render json: { data: {} }, status: 400
    end
  end
end
