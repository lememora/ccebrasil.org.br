class CreateEditors < ActiveRecord::Migration
  def self.up
    create_table :editors do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :salt

      t.timestamps
    end
    Editor.create(:name => "bona", :email => "bona@bonacode.com", :password => "bona01")
  end

  def self.down
    drop_table :editors
  end
end
