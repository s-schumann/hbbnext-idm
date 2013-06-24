module Api
  module V3
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
        @user = User.new(params[:user])
        @user.uuid = SecureRandom.uuid
        current_consumer ||= Consumer.find_by_access_token(params[:access_token])
        @user.created_by = current_consumer.email
        if @user.save
          respond_with @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PUT /users/1.json
      def update
        @user = User.find(params[:id])
        if not @user.created_by
          current_consumer ||= Consumer.find_by_access_token(params[:access_token])
          @user.created_by = current_consumer.email
          @user.save
        end
        @user = User.update(params[:id], params[:user])
        respond_with @user
      end

      # DELETE /users/1.json
      def destroy
        @user = User.destroy(params[:id])
        respond_with @user
      end

      private
        def restrict_access
          api_key = Consumer.find_by_access_token(params[:access_token])
          head :unauthorized unless api_key
        end
    end
  end
end
