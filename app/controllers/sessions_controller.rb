class SessionsController < ApplicationController
  def new
  end

  def create
  	consumer = Consumer.find_by_email(params[:email])
	if consumer && consumer.authenticate(params[:password])
		session[:consumer_id] = consumer.id
	    redirect_to root_url, notice: "Logged in!"
	else
	    flash.now.alert = "Email or password is invalid."
	end
  end

	def destroy
	  session[:consumer_id] = nil
	  redirect_to root_url, notice: "Logged out!"
	end
end
