class ApplicationController < ActionController::Base
  protect_from_forgery

  $currentTime = Time.now
  $currentVersion = "v1"

  private
	def current_consumer
		@current_consumer ||= Consumer.find(session[:consumer_id]) if session[:consumer_id]
	end
	helper_method :current_consumer

	def authorize
  		redirect_to login_url, alert: "Not authorized" if current_consumer.nil?
	end
end
