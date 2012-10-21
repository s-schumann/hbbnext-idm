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
        respond_with Device.create(params[:device])
      end
      
      # PUT /devices/1.json
      def update
        respond_with Device.update(params[:id], params[:devices])
      end
      
      # DELETE /devices/1.json
      def destroy
        respond_with Device.destroy(params[:id])
      end
    end
  end
end