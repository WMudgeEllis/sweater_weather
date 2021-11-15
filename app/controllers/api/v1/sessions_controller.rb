class Api::V1::SessionsController < ApplicationController


  def create

    user = User.find_by(email: params[:email])

    if user && user.validate(params[:password])
      # o:m for future scalability, but this is needed for o:m
      key = user.api_keys.first
      #bad naming convention
      render json: UserSerializer.new_user(user, key)
    else
      #403 bby
    end
  end

end
