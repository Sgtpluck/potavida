class Post < ActiveRecord::Base
  belongs_to :user
  validates  :title, :content, :date, presence: :true
end
