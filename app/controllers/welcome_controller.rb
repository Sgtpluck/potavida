class WelcomeController < ApplicationController
  layout 'welcome'
  
  def index
    @posts = Post.all
    @subscriber = Subscriber.new
  end
end
