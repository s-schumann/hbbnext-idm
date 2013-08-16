module Api
  module V2
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
          set_udr_name
          fill_empty_or_null
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
        set_udr_name
        fill_empty_or_null
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
        def set_udr_name
          @user.udrs.each do |udr|
            @user.attributes = {
              :udrs_attributes => [
                { :id => udr.id,
                  :name => "#{@user.username}:#{@user.devices.find(udr.device_id).display_name}",
                  :role_id => 4
                }
              ]
            }
            if not udr.uuid
              udr.uuid = SecureRandom.uuid
            end
            if not udr.created_by
              current_consumer ||= Consumer.find_by_access_token(params[:access_token])
              udr.created_by = current_consumer.email
            end
          end
          @user.update_attributes(params[:user])
        end
        def fill_empty_or_null
          if @user.avatar.blank?
            @user.avatar = "http://www.wpclipart.com/people/faces/anonymous/photo_not_available_large.png"
          end
          if @user.pref_price.blank?
            @user.pref_price = "0.5"
          end
          if @user.pref_usability.blank?
            @user.pref_usability = "0.5"
          end
          if @user.pref_responsiveness.blank?
            @user.pref_responsiveness = "0.5"
          end
          @user.save
        end
    end
  end
end
