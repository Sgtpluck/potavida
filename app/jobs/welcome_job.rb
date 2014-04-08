class WelcomeJob
  @queue = :email
  def self.perform(subscriber_id)
    WelcomeMailer.welcome(subscriber_id).deliver
  end
end