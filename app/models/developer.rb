class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  #connecting developer model directly to clicks and impressions for ads for faster count up on dashboard (may not be more efficient than going through advertiser)
  has_many :clicks
  has_many :impressions
  
  #connecting developer model with advertiser model (has many/has many) relationship through a relationship table/model called advertiser_developer_relationship
  has_many :advertiser_developer_relationships, :foreign_key => "developer_id",
											 :dependent => :destroy
									  
  has_many :advertisers, :through => :advertiser_developer_relationships
end
