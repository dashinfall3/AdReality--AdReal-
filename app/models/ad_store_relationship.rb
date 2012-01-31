class AdStoreRelationship < ActiveRecord::Base
	attr_accessible :ad_id, :store_id
	
	belongs_to :ad
	belongs_to :store
end
