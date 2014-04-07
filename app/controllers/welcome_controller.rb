class WelcomeController < ApplicationController
  layout 'welcome'
  
  def index
    @posts = Post.all
  end
end
