class Advertiser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  #connecting advertiser model directly to clicks and impressions for ads for faster count up on dashboard
  has_many :clicks
  has_many :impressions
  
  #connecting advertiser model to their ads
  has_many :ads
  
  #connecting advertiser model to their store locations
  has_many :stores
  
  #connecting advertiser model with developer model (has many/has many) relationship through a relationship table/model called advertiser_developer_relationship
  has_many :advertiser_developer_relationships, :foreign_key => "advertiser_id",
											 :dependent => :destroy
									  
  has_many :developers, :through => :advertiser_developer_relationships
end
