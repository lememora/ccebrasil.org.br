class AddLinkToProgramGenericAttributes < ActiveRecord::Migration
  
  def self.up
    add_column :program_generic_attributes, :url, :string
  end

  def self.down
    remove_column :program_generic_attributes, :url
  end
  
end
