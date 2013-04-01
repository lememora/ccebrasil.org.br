class Article < ActiveRecord::Base
  
  acts_as_list
  
  validates_presence_of :title
  validates_uniqueness_of :title, :case_sensitive => false
  
  validates_presence_of :subtitle
  validates_presence_of :description
  
  has_attached_file :article_image, :styles => { :thumb => "144x155#", :final => "514x274#" }
  
  before_save :update_permalink

   def update_permalink
     self.permalink = Cce::Convert::input_to_permalink(self.title)
   end
  
end
