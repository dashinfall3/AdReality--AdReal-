class AdStoreRelationshipTable < ActiveRecord::Migration
  def self.up
    create_table :ad_store_relationships do |t|
      t.integer :ad_id
      t.integer :store_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_store_relationships
  end
end