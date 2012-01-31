class PagesController < ApplicationController
  def home
    @title = "Home"
    if developer_signed_in?
    	@clicks=current_developer.clicks.count
    	@impressions=current_developer.impressions.count
    	@advertisers=current_developer.advertisers
	end
    if advertiser_signed_in?
    	@ads=current_advertiser.ads.count
    	@clicks=current_advertiser.clicks.count
    	@impressions=current_advertiser.impressions.count
    	@apps=current_advertiser.developers
	end
  end
  
  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def press
  	@title = "Press"
  end
  
end
