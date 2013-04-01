class Program < ActiveRecord::Base
  
  acts_as_list
  
  belongs_to :program_category
  
  has_many :program_generic_attributes, :dependent => :destroy
  
  validates_presence_of :title
  #validates_uniqueness_of :title, :case_sensitive => false
  
  validates_presence_of :where
  validates_presence_of :when
  validates_presence_of :day
  validates_presence_of :month
  validates_presence_of :year
  
  validates_presence_of :extract
  validates_presence_of :description
  
  has_attached_file :program_image, :styles => { :thumb => "152x155#" }
  
  before_save :update_permalink
  before_save :check_dates
  
  after_save :save_generic_attributes
  
  def check_dates
    if self.finish_day.nil?
      self.finish_day = self.day
    end
    if self.finish_month.nil?
      self.finish_month = self.month
    end
    if self.finish_year.nil?
      self.finish_year = self.year
    end    
    self.start_date = "#{self.year}-#{self.month}-#{self.day} 00:00:00"
    self.finish_date = "#{self.finish_year}-#{self.finish_month}-#{self.finish_day} 23:59:59"
  end
  
  def update_permalink
    self.permalink = Cce::Convert::input_to_permalink(self.title)
  end
  
  def generic_attributes=(generic_attributes)
    generic_attributes.each do |attributes|
      if attributes[:id].blank?
        program_generic_attributes.build(attributes)
      else
        program_generic_attribute = program_generic_attributes.detect { |pga| pga.id == attributes[:id].to_i }
        program_generic_attribute.attributes = attributes
      end
    end
  end
  
  def save_generic_attributes
    program_generic_attributes.each do |pga|
      if pga.should_destroy?
        pga.destroy
      else
        pga.save(false)
      end
    end
  end
  
end
