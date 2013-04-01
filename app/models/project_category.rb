class ProjectCategory < ActiveRecord::Base
  
  has_many :projects
  
  before_save :update_permalink
  
  def update_permalink
    self.permalink = Cce::Convert::input_to_permalink(self.title)
  end
  
end
