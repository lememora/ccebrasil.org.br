class PressKit < ActiveRecord::Base
  
  acts_as_list
  
  has_many :press_documents, :order => :position, :dependent => :destroy
  
end
