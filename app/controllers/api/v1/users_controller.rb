class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if params[:password] != params[:password_confirmation]
      render json: ErrorSerializer.password_mismatch, status: 400
    elsif user.save
      key = user.api_keys.create!(key: SecureRandom.hex)
      render json: UserSerializer.new_user(user, key), status: 201
    else
      errors = user.errors.full_messages
      render json: ErrorSerializer.general(errors), status: 403
    end
  end

  private
  def user_params
    params.permit(:email, :password)
  end
end
