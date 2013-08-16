module Api
  module V2
    class DevicesController < ApplicationController
      before_filter :restrict_access
      respond_to :json

      # GET /devices.json
      def index
      	@devices = Device.all
        respond_with @devices
      end

      # GET /devices/1.json
      def show
        @device = Device.find(params[:id])

        @cids = []
        @device.udrs.each do |udr|
          udr.contexts.each do |context|
            @cids.push(context.id)
          end
        end

        respond_with @device, @cids
      end

      # POST /devices.json
      def create
        @device = Device.new(params[:device])
        @device.uuid = SecureRandom.uuid
        current_consumer ||= Consumer.find_by_access_token(params[:access_token])
        @device.created_by = current_consumer.email
        if @device.save
          set_udr_name
          respond_with @device, status: :created, location: @device
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end

      # PUT /devices/1.json
      def update
        @device = Device.find(params[:id])
        if @device.update_attributes(params[:device])
          if not @device.created_by
            current_consumer ||= Consumer.find_by_access_token(params[:access_token])
            @device.created_by = current_consumer.email
          end
          set_udr_name
        end
        respond_with @device
      end

      # DELETE /devices/1.json
      def destroy
        @device = Device.destroy(params[:id])
        respond_with @device
      end

      private
        def restrict_access
          api_key = Consumer.find_by_access_token(params[:access_token])
          head :unauthorized unless api_key
        end
        def set_udr_name
          @device.udrs.each do |udr|
            @device.attributes = {
              :udrs_attributes => [
                { :id => udr.id,
                  :name => "#{@device.users.find(udr.user_id).username}:#{@device.display_name}",
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
          @device.update_attributes(params[:device])
        end
    end
  end
end
