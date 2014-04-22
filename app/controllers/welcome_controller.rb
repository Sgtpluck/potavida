class WelcomeController < ApplicationController
  layout 'welcome'
  
  def index
    @posts = Post.all
    @subscriber = Subscriber.new
    @press = Press.order('pubdate DESC')
  end
end