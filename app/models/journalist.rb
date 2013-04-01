require 'digest/sha1'

class Journalist < ActiveRecord::Base
  
  validates_presence_of :name 
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i 
  validates_uniqueness_of :email
  validates_presence_of :password, :within=> 5..255
  
  attr_protected :id, :salt
  
  before_save :generate_salt
  
  def password=(p) 
   self[:password] = Journalist.encrypt(p) unless p.blank? 
  end

  def self.encrypt(p)
   Digest::SHA1.hexdigest(p)
  end
  
  def generate_salt
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(23) { |i| newpass << chars[rand(chars.size-1)] }
    self.salt = newpass
  end
  
end
