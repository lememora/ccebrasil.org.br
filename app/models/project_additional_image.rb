class ProjectAdditionalImage < ActiveRecord::Base
  
  belongs_to :project
  
  acts_as_list :scope => :project
  
  has_attached_file :prj_add_image, :styles => { :thumb => "87x76#" }
  
end
