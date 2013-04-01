class ProgramUser < ActiveRecord::Base
    
  before_save :generate_salt
  
  def generate_salt
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    salt = ""
    1.upto(23) { |i| salt << chars[rand(chars.size-1)] }
    self[:salt] = salt
  end
  
end
