class ProtectedFile < ActiveRecord::Base
  
  has_attached_file :pf
  
  before_create :init_downloads
  before_create :generate_salt
  
  def init_downloads
    self[:downloads] = 0
  end
  
  def generate_salt
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    salt = ""
    1.upto(36) { |i| salt << chars[rand(chars.size-1)] }
    self[:salt] = salt
  end
  
end
