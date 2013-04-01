class CreateLivingFileLinks < ActiveRecord::Migration
  def self.up
    create_table :living_file_links do |t|
      t.references :living_file
      t.string :categ
      t.string :title
      t.string :url
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :living_file_links
  end
end
