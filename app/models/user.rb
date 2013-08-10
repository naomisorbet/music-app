require 'SecureRandom'

class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :password, :session_token

  def self.validate(email, password)
    user = self.find_by_email(email)
    return nil if user.nil?
    return user if user.password == password
    nil
  end

  def update_token!
    self.session_token = SecureRandom.urlsafe_base64(32)
    self.save
    self.session_token
  end

end
