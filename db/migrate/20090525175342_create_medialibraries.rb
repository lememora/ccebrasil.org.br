class CreateMedialibraries < ActiveRecord::Migration
  def self.up
    create_table :medialibraries do |t|
      t.text :description
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :medialibraries
  end
end
