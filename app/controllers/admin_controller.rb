class AdminController < ApplicationController
  def index
    @client_ip = request.remote_ip
    @remote_ip =  ip_addresses = `ifconfig -a | grep 'inet ' | grep -v 127.0.0.1 | cut -d':' -f 2 | cut -d' ' -f 1`.split
  end
end
