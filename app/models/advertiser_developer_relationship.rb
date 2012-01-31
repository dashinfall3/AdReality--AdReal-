class AdvertiserDeveloperRelationship < ActiveRecord::Base
	attr_accessible :advertiser_id, :developer_id
	
	belongs_to :advertiser
	belongs_to :developer
end
