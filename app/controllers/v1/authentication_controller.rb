module V1
  class AuthenticationController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    def create
      # password = params.require(:password);
      username = params.require(:username);

      user = User.find_by(userName: username);
      token = AuthenticationTokenService.call(user.id)
      render json: { token: token }, status: :created
    end

    private
    def parameter_missing(e)
      render json: { error: e.message }, status: :unprocessable_entity
    end

  end

end