class CreateClicks < ActiveRecord::Migration
  def self.up
    create_table :clicks do |t|
      t.string :developer_id
      t.decimal :latitude
      t.decimal :longitude
      t.string :user_info
      t.integer :ad_id
      t.integer :advertiser_id
      t.integer :store_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clicks
  end
end
