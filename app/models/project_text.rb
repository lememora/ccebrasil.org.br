class ProjectText < ActiveRecord::Base
  
  belongs_to :project
  
  acts_as_list :scope => :project
  
  has_attached_file :prj_txt
  
end
