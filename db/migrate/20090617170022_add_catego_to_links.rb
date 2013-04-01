class AddCategoToLinks < ActiveRecord::Migration
  
  def self.up
    add_column :partner_sites, :categ, :string
  end

  def self.down
    remove_column :partner_sites, :categ
  end
  
end
