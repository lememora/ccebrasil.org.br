class Project < ActiveRecord::Base
  
  acts_as_list
  
  belongs_to :project_category
  
  has_many :project_additional_images, :order => :position, :dependent => :destroy
  has_many :project_videos, :order => :position, :dependent => :destroy
  has_many :project_texts, :order => :position, :dependent => :destroy
  has_many :project_documents, :order => :position, :dependent => :destroy
  has_many :project_audios, :order => :position, :dependent => :destroy
  has_many :project_links, :order => :position, :dependent => :destroy
  
  validates_presence_of :title
  validates_uniqueness_of :title, :case_sensitive => false
  
  #validates_presence_of :where
  #validates_presence_of :when
  validates_presence_of :extract
  validates_presence_of :description
  
  has_attached_file :project_image, :styles => { :final => "584x278#", :small => "55x55#" }
  
  before_save :update_permalink

  def update_permalink
    self.permalink = Cce::Convert::input_to_permalink(self.title)
  end
  
end
