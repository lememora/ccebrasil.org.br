class SocialnetworkSite < ActiveRecord::Base
  
  acts_as_list
  
  validates_presence_of :title
  validates_presence_of :url
  
  has_attached_file :sn_icon, :styles => { :icon => "20x20!" }
  
end
