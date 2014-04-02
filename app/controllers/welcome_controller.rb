class WelcomeController < ApplicationController
  skip_authorization_check [:index]
  
  def index
  end
end
