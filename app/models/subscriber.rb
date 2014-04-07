class Subscriber < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /.+@(\w+\.)+\w+/, message: 'Must enter a valid email address.' }

end
