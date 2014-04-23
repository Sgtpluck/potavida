class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      Resque.enqueue(WelcomeJob, @subscriber.id)
    redirect_to root_path
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end