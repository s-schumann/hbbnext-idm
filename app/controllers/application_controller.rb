class ApplicationController < ActionController::Base
  protect_from_forgery

  $currentTime = Time.now
  $currentVersion = 1

  private
	def current_consumer
	@current_consumer ||= Consumer.find(session[:consumer_id]) if session[:consumer_id]
	end
	helper_method :current_consumer

end
