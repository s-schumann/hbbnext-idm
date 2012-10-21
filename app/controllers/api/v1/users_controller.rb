module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json 
      
      # GET /users.json
      def index
      	@users = User.all
        respond_with @users
      end
      
      # GET /users/1.json
      def show
      	@user = User.find(params[:id])
        respond_with @user
      end
      
      # POST /users.json
      def create
      #  @user = User.create(params[:user])
      #  respond_with @user
        head :forbidden
      end
      
      # PUT /users/1.json
      def update
      #  @user = User.update(params[:id], params[:users])
      #  respond_with @user
        head :forbidden
      end
      
      # DELETE /users/1.json
      def destroy
      #  @user = User.destroy(params[:id])
      #  respond_with @user
        head :forbidden
      end
    end
  end
end
