class CreateAecidSites < ActiveRecord::Migration
  def self.up
    create_table :aecid_sites do |t|
      t.string :title
      t.string :url
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :aecid_sites
  end
end
