module Api
  module V1
  	module Resources
	  class UsersController < ApplicationController
		respond_to :json

		# GET /users.json
		def index
		end
	  end
	end
  end
end
