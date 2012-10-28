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
        if @device.save
          respond_with @device, status: :created, location: @device
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end
      
      # PUT /devices/1.json
      def update
      #  @device = Device.update(params[:id], params[:devices])
      #  respond_with @device
        head :forbidden
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
    end
  end
end
