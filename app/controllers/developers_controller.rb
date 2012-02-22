class DevelopersController < ApplicationController
	def index
	end
	
	def show
		if developer_signed_in?
    		@clicks=current_developer.clicks.count
    		@impressions=current_developer.impressions.count
    		@advertisers=current_developer.advertisers
		end
	end
	
	
end