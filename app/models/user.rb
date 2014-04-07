class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password_digest, presence: true
  validates :name, :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /.+@(\w+\.)+\w+/, message: 'Must enter a valid email address.' }
  has_many  :posts

  def update_roles(role_params)
    update(role: role_params[:role])
  end

end
