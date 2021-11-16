class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      key = user.api_keys.first
      render json: UserSerializer.new_user(user, key)
    elsif user.nil? || !user.authenticate(params[:password])
      render json: { body: 'bad credentials' }, status: 403
    end
  end
end
