class CreatePressKits < ActiveRecord::Migration
  def self.up
    create_table :press_kits do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :press_kits
  end
end
