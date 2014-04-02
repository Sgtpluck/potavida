class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password_digest, presence: true
  validates :name, :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /.+@(\w+\.)+\w+/, message: 'Must enter a valid email address.' }

end
