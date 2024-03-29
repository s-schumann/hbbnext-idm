module Api
  module V1
    class UsersController < ApplicationController
      before_filter :restrict_access
      respond_to :json 
      
      # GET /users.json
      def index
      	@users = User.all
        respond_with @users
      end
      
      # GET /users/1.json
      def show
      	@user = User.find(params[:id])

        @cids = []
        @user.udrs.each do |udr|
          udr.contexts.each do |context|
            @cids.push(context.id)
          end
        end
        
        respond_with @user, @cids
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
      
      private
        def restrict_access
          api_key = Consumer.find_by_access_token(params[:access_token])
          head :unauthorized unless api_key
        end
    end
  end
end
