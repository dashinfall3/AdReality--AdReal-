class AddNameColumnToAdvertiser < ActiveRecord::Migration
  def self.up
  	add_column :advertisers, :name, :string
  end

  def self.down
  	remove_column :advertisers, :name
  end
end
