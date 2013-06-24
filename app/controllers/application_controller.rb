class ApplicationController < ActionController::Base
  protect_from_forgery

  $currentTime = Time.now
  $currentVersion = "v3"
  $currentRelease = "1.3.1-dev" # X.Y.Z  X-LAST milestone (min. 1), Y-release, Z-increment. Tag starts at 1.0.0, afterwards increase with release. -dev added until new release ready.
  $normalizationInterval = 60

  private
	def current_consumer
		@current_consumer ||= Consumer.find(session[:consumer_id]) if session[:consumer_id]
	end
	helper_method :current_consumer

	def authorize
  		redirect_to login_url, alert: "Not authorized" if current_consumer.nil?
	end
end
