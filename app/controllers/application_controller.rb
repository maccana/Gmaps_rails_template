class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # included from lib/assets 
  include AuthenticatedSystem 
end
