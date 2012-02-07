class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
  # if advertiser do this one, if developer do a different one
    "http://www.google.com" # <- Path you want to redirect the user to.
  end
end
