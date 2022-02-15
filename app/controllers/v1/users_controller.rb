module V1
  class UsersController < ApplicationController
    def index
      render json: User.all
    end

    def create
      user = User.new(user_params);
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end


    def user_params
      params.require(:user).permit(:userName, :firstName, :lastName, :email, :password);
    end
  end  
end