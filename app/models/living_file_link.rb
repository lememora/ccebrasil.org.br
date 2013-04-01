class LivingFileLink < ActiveRecord::Base
  
  belongs_to :living_file
  
  acts_as_list :scope => :living_file
  
end
