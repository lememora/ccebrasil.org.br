class CalendarImage < ActiveRecord::Base
  
  validates_presence_of :month
  validates_presence_of :year
  validates_presence_of :credits
  validates_presence_of :url
  
  has_attached_file :calendar_image, :styles => { :approved => "584x278!" }
  
end
