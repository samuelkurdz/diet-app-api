module V1

  class AuthenticationController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    def create
      # username = params[:username];
      # password = params[:password]
      # user = User.find_by(userName: username)
      # puts user.password === password
      p params.require(:username).inspect
      p params.require(:password).inspect
      render json: {token: '1234'}, status: :created
    end

    private
    def parameter_missing(e)
      render json: { error: e.message }, status: :unprocessable_entity
    end

  end

end