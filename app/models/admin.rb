class Admin < ApplicationRecord
  attr_accessor :password
  EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@(ccu.cl|CCU.CL)\z/
  validates :username, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, confirmation: true # password_confirmation
  validates_length_of :password, in: 6..20, on: :create

  before_save :encrypt_password
  before_save :clean_fields
  after_save :clear_password

  # Encrypt pass
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  # Clean input pass from user
  def clear_password
    self.password = nil
  end

  # Authentication
  def self.authenticate(username_or_email="", login_password="")
    if  EMAIL_REGEX.match(username_or_email)
      admin = Admin.find_by_email(username_or_email)
    else
      admin = Admin.find_by_username(username_or_email)
    end
    if admin && admin.match_password(login_password)
      return admin
    else
      return false
    end
  end

  # Compare pass input and pass in DB
  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  # to lower case and strip uasename and email
  def clean_fields
   self.username.downcase! unless self.username.blank?
   self.username.strip! unless self.username.blank?
   self.email.downcase! unless self.email.blank?
   self.email.strip! unless self.email.blank?
  end


end
