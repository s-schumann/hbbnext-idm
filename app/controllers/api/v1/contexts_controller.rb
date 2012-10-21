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
        @context = Context.find(params[:id])
        respond_with @context
      end
      
      # POST /contexts.json
      def create
      #  @context = Context.create(params[:context])
      #  respond_with @context
        head :forbidden
      end
      
      # PUT /contexts/1.json
      def update
      #  @context = Context.update(params[:id], params[:contexts])
      #  respond_with @context
        head :forbidden
      end
      
      # DELETE /contexts/1.json
      def destroy
      #  @context = Context.destroy(params[:id])
      #  respond_with @context
        head :forbidden
      end
    end
  end
end
