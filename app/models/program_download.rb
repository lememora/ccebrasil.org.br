class ProgramDownload < ActiveRecord::Base
  
  validates_presence_of :month
  validates_presence_of :year
  
  has_attached_file :program_download
  
end
