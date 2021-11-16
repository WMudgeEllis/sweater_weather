class Api::V1::SessionsController < ApplicationController


  def create

    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # o:m for future scalability, but this is needed for o:m
      key = user.api_keys.first
      #bad naming convention
      render json: UserSerializer.new_user(user, key)
    elsif user.nil? || !user.authenticate(params[:password])
      render json: { body: 'bad credentials' }, status: 403
    end
  end

end
