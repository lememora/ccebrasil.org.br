class LivingFileAudio < ActiveRecord::Base
  
  belongs_to :living_file
  
  acts_as_list :scope => :living_file
  
  has_attached_file :lf_audio
  
end
