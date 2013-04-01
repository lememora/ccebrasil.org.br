class CreatePartnerSites < ActiveRecord::Migration
  def self.up
    create_table :partner_sites do |t|
      t.string :title
      t.string :url
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :partner_sites
  end
end
