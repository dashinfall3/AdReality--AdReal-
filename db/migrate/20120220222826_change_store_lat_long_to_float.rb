class ChangeStoreLatLongToFloat < ActiveRecord::Migration
  def self.up
  	change_table :stores do |t|
      t.change :latitude, :float
      t.change :longitude, :float
    end
  end

  def self.down
    change_table :stores do |t|
      t.change :latitude, :integer
      t.change :longitude, :integer
    end
  end
end
