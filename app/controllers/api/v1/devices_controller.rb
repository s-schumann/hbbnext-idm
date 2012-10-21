module Api
  module V1
    class DevicesController < ApplicationController
      respond_to :json
      
      # GET /devices.json
      def index
      	@devices = Device.all
        respond_with @devices
      end
      
      # GET /devices/1.json
      def show
        @device = Device.find(params[:id])
        respond_with @device
      end
      
      # POST /devices.json
      def create
      #  @device = Device.create(params[:device])
      #  respond_with @device
        head :forbidden
      end
      
      # PUT /devices/1.json
      def update
      #  @device = Device.update(params[:id], params[:devices])
      #  respond_with @device
        head :forbidden
      end
      
      # DELETE /devices/1.json
      def destroy
      #  @device = Device.destroy(params[:id])
      #  respond_with @device
        head :forbidden
      end
    end
  end
end
