class PressDocument < ActiveRecord::Base
  
  belongs_to :press_kit
  
  acts_as_list :scope => :press_kit
  
  has_attached_file :presskit
  
  has_attached_file :presskit_thumb, :styles => { :thumb => "55x55#" }
  
end
