class AdvertiserDeveloperRelationshipTable < ActiveRecord::Migration
  def self.up
    create_table :advertiser_developer_relationships do |t|
      t.integer :advertiser_id
      t.integer :developer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :advertiser_developer_relationships
  end
end