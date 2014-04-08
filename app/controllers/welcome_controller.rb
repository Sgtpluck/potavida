class WelcomeController < ApplicationController
  layout 'welcome'
  
  def index
    @subscriber = Subscriber.new
  end
end
