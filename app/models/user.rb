class User < ActiveRecord::Base
  attr_accessor :password
  before_create :encrypt_password

  validates_confirmation_of :password

  validates_presence_of :email
  validates_uniqueness_of :email

protected
  def encrypt_password
    puts "i am called"
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
