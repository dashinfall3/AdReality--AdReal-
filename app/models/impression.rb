class Impression < ActiveRecord::Base
	attr_accessible :latitude, :longitude, :user_info, :ad, :company, :store, :developer
	belongs_to :developer
	belongs_to :advertiser
	belongs_to :ad
end
