class CreateMedialibraryAbouts < ActiveRecord::Migration
  def self.up
    create_table :medialibrary_abouts do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :medialibrary_abouts
  end
end
