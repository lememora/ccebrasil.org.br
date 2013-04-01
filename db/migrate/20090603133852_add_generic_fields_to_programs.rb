class AddGenericFieldsToPrograms < ActiveRecord::Migration
  
  def self.up
    remove_column :programs, :where
    remove_column :programs, :when
    add_column :programs, :generic_title_1, :string
    add_column :programs, :generic_desc_1, :string
    add_column :programs, :generic_title_2, :string
    add_column :programs, :generic_desc_2, :string
    add_column :programs, :generic_title_3, :string
    add_column :programs, :generic_desc_3, :string
    add_column :programs, :generic_title_4, :string
    add_column :programs, :generic_desc_4, :string
    add_column :programs, :generic_title_5, :string
    add_column :programs, :generic_desc_5, :string
    add_column :programs, :generic_title_6, :string
    add_column :programs, :generic_desc_6, :string
    add_column :programs, :generic_title_7, :string
    add_column :programs, :generic_desc_7, :string
    add_column :programs, :generic_title_8, :string
    add_column :programs, :generic_desc_8, :string
  end

  def self.down
    add_column :programs, :where, :string
    add_column :programs, :when, :string
    remove_column :programs, :generic_title_1
    remove_column :programs, :generic_desc_1
    remove_column :programs, :generic_title_2
    remove_column :programs, :generic_desc_2
    remove_column :programs, :generic_title_3
    remove_column :programs, :generic_desc_3
    remove_column :programs, :generic_title_4
    remove_column :programs, :generic_desc_4
    remove_column :programs, :generic_title_5
    remove_column :programs, :generic_desc_5
    remove_column :programs, :generic_title_6
    remove_column :programs, :generic_desc_6
    remove_column :programs, :generic_title_7
    remove_column :programs, :generic_desc_7
    remove_column :programs, :generic_title_8
    remove_column :programs, :generic_desc_8
  end
  
end
