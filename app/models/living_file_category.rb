class LivingFileCategory < ActiveRecord::Base
  
  has_many :living_files
  
  before_save :update_permalink

   def update_permalink
     self.permalink = Cce::Convert::input_to_permalink(self.category)
   end
  
end
