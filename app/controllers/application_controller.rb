class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
  	#if advertiser do this one, if developer do a different one
    if advertiser_signed_in?
    	advertiser_path(current_advertiser)
    else 
    	developer_path(current_developer)
    end
  end
end
