class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      Resque.enqueue(WelcomeJob, @subscriber.id)
    end
    redirect_to root_path
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end