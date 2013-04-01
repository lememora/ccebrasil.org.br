class LivingFileAdditionalImage < ActiveRecord::Base
  
  belongs_to :living_file
  
  acts_as_list :scope => :living_file
  
  has_attached_file :lf_add_image, :styles => { :thumb => "87x76#" }
  
end
