class ApplicationController < ActionController::Base
  protect_from_forgery

  $currentTime = Time.now
  $currentVersion = 1
end
