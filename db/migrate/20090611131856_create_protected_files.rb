class CreateProtectedFiles < ActiveRecord::Migration
  def self.up
    create_table :protected_files do |t|
      t.string :name
      t.text :message
      t.string :email
      t.integer :downloads
      t.string :salt
      t.string :pf_file_name
      t.string :pf_content_type
      t.integer :pf_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :protected_files
  end
end
