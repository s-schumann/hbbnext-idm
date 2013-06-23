module Api
  module V3
    module Active
      class UsersController < ApplicationController

        # GET /contexts/1/active/users
        def index
          @context = Context.find(params[:context_id])
        end

        # GET /contexts/1/active/users/2
        def show
          head :forbidden
        end

        # POST /contexts/1/active/users
        def create
          head :forbidden
        end

        # PUT /contexts/1/active/users/2
        def update
          head :forbidden
        end

        # DELETE /contexts/1/active/users/2
        def destroy
          head :forbidden
        end
      end
    end
  end
end
