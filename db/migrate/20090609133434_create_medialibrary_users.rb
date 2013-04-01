class CreateMedialibraryUsers < ActiveRecord::Migration
  def self.up
    create_table :medialibrary_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :medialibrary_users
  end
end
