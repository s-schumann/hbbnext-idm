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
        respond_with User.create(params[:user])
      end
      
      # PUT /users/1.json
      def update
        respond_with User.update(params[:id], params[:users])
      end
      
      # DELETE /users/1.json
      def destroy
        respond_with User.destroy(params[:id])
      end
    end
  end
end