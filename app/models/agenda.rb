class Agenda < ActiveRecord::Base
  
  acts_as_list
  
  validates_presence_of :title
  validates_uniqueness_of :title, :case_sensitive => false
  
  validates_presence_of :where
  validates_presence_of :when
  validates_presence_of :url
  
end
