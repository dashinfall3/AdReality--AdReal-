class Ad < ActiveRecord::Base
  #Setup accessible (or protected) attributes for your model
  attr_accessible :name, :headline, :body, :impression_count, :click_count, :category
  
  #connecting ad model directly to clicks and impressions for ads for faster count up on dashboard
  has_many :clicks
  has_many :impressions
  
  #connecting ad model with stores (has many/has many) relationship through a relationship table/model called ad_store_relationship
  has_many :ad_store_relationships, :foreign_key => "ad_id",
											 :dependent => :destroy
									  
  has_many :stores, :through => :ad_store_relationships
  
  #connecting Ad Class/Model to the Advertiser owning it
  belongs_to :advertiser
  
end
