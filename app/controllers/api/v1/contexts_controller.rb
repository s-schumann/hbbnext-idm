module Api
  module V1
    class ContextsController < ApplicationController
      respond_to :json
      
      # GET /contexts.json
      def index
      	@contexts = Context.all
        respond_with @contexts
      end
      
      # GET /contexts/1.json
      def show
        respond_with Context.find(params[:id])
      end
      
      # POST /contexts.json
      def create
        respond_with Context.create(params[:context])
      end
      
      # PUT /contexts/1.json
      def update
        respond_with Context.update(params[:id], params[:contexts])
      end
      
      # DELETE /contexts/1.json
      def destroy
        respond_with Context.destroy(params[:id])
      end
    end
  end
end