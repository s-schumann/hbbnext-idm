class AdminController < ApplicationController
  def index
    @client_ip = request.remote_ip
    @remote_ip = request.ip
  end
end
