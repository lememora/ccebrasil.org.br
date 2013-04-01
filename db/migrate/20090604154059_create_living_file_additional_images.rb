class CreateLivingFileAdditionalImages < ActiveRecord::Migration
  def self.up
    create_table :living_file_additional_images do |t|
      t.references :living_file
      t.string :title
      t.integer :position
      t.string :lf_add_image_file_name
      t.string :lf_add_image_content_type
      t.integer :lf_add_image_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :living_file_additional_images
  end
end
