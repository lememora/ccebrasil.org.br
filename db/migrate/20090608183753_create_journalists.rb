class CreateJournalists < ActiveRecord::Migration
  def self.up
    create_table :journalists do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :journalists
  end
end
