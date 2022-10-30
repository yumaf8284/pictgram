class ApplicationController < ActionController::Base
  protect_from_forgery width: :exception
  
  add_flash_types :success, :info, :warning, :danger
end
