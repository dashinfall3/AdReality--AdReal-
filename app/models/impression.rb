class Impression < ActiveRecord::Base
	attr_accessible :latitude, :longitude, :user_info, :ad_id, :store_id, :developer_id
	belongs_to :developer
	belongs_to :advertiser
	belongs_to :ad
	belongs_to :store
end
