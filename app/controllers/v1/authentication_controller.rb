module V1
  class AuthenticationController < ApplicationController
    class AuthenticationError < StandardError; end
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from AuthenticationError, with: :handle_unauthenticated
    def create
      password = params.require(:password);
      username = params.require(:username);

      user = User.find_by(userName: username);
      raise AuthenticationError unless user.authenticate(password);
      token = AuthenticationTokenService.call(user.id);
      render json: { token: token }, status: :created
      # render json: { token: token, user: UserRepresenter.new(user).as_json }, status: :created
    end

    private
    def parameter_missing(e)
      render json: { error: e.message }, status: :unprocessable_entity
    end
    def handle_unauthenticated
      head :unauthorized;
    end

  end

end