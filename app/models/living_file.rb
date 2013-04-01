class LivingFile < ActiveRecord::Base
  
  acts_as_list
  
  belongs_to :living_file_category
  
  has_many :living_file_additional_images, :order => :position, :dependent => :destroy
  has_many :living_file_videos, :order => :position, :dependent => :destroy
  has_many :living_file_texts, :order => :position, :dependent => :destroy
  has_many :living_file_documents, :order => :position, :dependent => :destroy
  has_many :living_file_audios, :order => :position, :dependent => :destroy
  has_many :living_file_links, :order => :position, :dependent => :destroy
  
  validates_presence_of :title
  validates_uniqueness_of :title, :case_sensitive => false
  
  validates_presence_of :description
  
  has_attached_file :living_file, :styles => { :final => "584x258#", :small => "55x55#" }
                                    
  before_save :update_permalink

  def update_permalink
    self.permalink = Cce::Convert::input_to_permalink(self.title)
  end
  
end
