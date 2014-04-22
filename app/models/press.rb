class Press < ActiveRecord::Base
   validates  :title, :url, :pubdate, presence: :true
end
