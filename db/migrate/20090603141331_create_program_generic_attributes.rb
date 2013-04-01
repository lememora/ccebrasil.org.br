class CreateProgramGenericAttributes < ActiveRecord::Migration
  def self.up
    create_table :program_generic_attributes do |t|
      t.references :program
      t.string :title
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :program_generic_attributes
  end
end
