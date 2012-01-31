class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :state
      t.integer :zip
      t.string :city
      t.string :address
      t.integer :advertiser_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
