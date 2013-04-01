class Highlight < ActiveRecord::Base
  
  has_attached_file :highlight_image, :styles => { :thumb => "278x210#" }
  
end
