class AddImageCreditsToProjects < ActiveRecord::Migration
  
  def self.up
    add_column :projects, :image_credits, :string
  end

  def self.down
    remove_column :projects, :image_credits
  end
  
end
