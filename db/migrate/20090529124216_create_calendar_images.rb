class CreateCalendarImages < ActiveRecord::Migration
  def self.up
    create_table :calendar_images do |t|
      t.integer :month
      t.integer :year
      t.string :credits
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :calendar_images
  end
end
