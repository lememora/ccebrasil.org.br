class AddImageCreditsToLivingFiles < ActiveRecord::Migration
  
  def self.up
    add_column :living_files, :image_credits, :string
  end

  def self.down
    remove_column :living_files, :image_credits
  end
  
end
