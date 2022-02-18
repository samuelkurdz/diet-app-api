module V1
  class UsersController < ApplicationController
    def index
      render json: User.all
    end

    def create
      user = User.new(create_user_params);
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      User.find(params[:id]).destroy!    
      head :no_content
    end


    def create_user_params
      params.require(:user).permit(:userName, :firstName, :lastName, :email, :password, :country_id);
    end
  end  
end