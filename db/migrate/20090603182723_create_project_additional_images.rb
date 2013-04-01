class CreateProjectAdditionalImages < ActiveRecord::Migration
  def self.up
    create_table :project_additional_images do |t|
      t.references :project
      t.string :title
      t.integer :position
      t.string :prj_add_image_file_name
      t.string :prj_add_image_content_type
      t.integer :prj_add_image_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :project_additional_images
  end
end
