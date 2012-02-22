class Store < ActiveRecord::Base
  #Setup accessible (or protected) attributes for your model
  attr_accessible :latitude, :longitude, :state, :zip, :city, :address, :name
  #Need to geocode address when adding stores to database
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  #connecting Store Class/Model to the Advertiser owning it
  belongs_to :advertiser
  
  #connecting store model with ad model (has many/has many) relationship through a relationship table/model called ad_store_relationship
  has_many :ad_store_relationships, :foreign_key => "store_id",
											 :dependent => :destroy
									  
  has_many :ads, :through => :ad_store_relationships
  
  has_many :clicks
  has_many :impressions
  
end
