class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :name
      t.string :headline
      t.string :body
      t.integer :advertiser_id
      t.integer :impression_count
      t.integer :click_count
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
