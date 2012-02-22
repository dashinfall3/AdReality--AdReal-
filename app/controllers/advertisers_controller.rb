class AdvertisersController < ApplicationController
	def index
	end
	
	def show
	    if advertiser_signed_in?
    		@ads=current_advertiser.ads.count
    		@clicks=current_advertiser.clicks.count
    		@impressions=current_advertiser.impressions.count
    		@apps=current_advertiser.developers
		end
	end
	
	
end