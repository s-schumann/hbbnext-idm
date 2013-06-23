module Api
  module V3
    class ContextsController < ApplicationController
      before_filter :restrict_access
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
        @context = Context.new(params[:context])
        @context.uuid = SecureRandom.uuid
        if @context.save
          respond_with @context, status: :created, location: @context
        else
          render json: @context.errors, status: :unprocessable_entity
        end
      end

      # PUT /contexts/1.json
      def update
        @context = Context.update(params[:id], params[:context])
        respond_with @context
      end

      # DELETE /contexts/1.json
      def destroy
        @context = Context.destroy(params[:id])
        respond_with @context
      end

      # GET /contexts/1/active
      def active
        @context = Context.find(params[:context_id])
      end

      private
        def restrict_access
          api_key = Consumer.find_by_access_token(params[:access_token])
          head :unauthorized unless api_key
        end
    end
  end
end
