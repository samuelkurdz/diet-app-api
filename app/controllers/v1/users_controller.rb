module V1
  class UsersController < ApplicationController
    def index
      users = User.all

      render json: UsersRepresenter.new(users).as_json
    end

    def create
      user = User.new(create_user_params);
      if user.save
        render json: UserRepresenter.new(user).as_json, status: :created
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