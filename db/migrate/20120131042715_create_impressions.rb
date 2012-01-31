class CreateImpressions < ActiveRecord::Migration
  def self.up
    create_table :impressions do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.integer :developer_id
      t.integer :ad_id
      t.integer :advertiser_id
      t.integer :store_id
      t.string :user_info
      
      t.timestamps
    end
  end

  def self.down
    drop_table :impressions
  end
end
