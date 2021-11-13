class Api::V1::BackgroundsController < ApplicationController

  def index
    image_info = UnsplashService.search(params[:location])[:results][0]
    background = Background.new(image_info)
    render json: BackgroundSerializer.background(background, params[:location])
  end

end
