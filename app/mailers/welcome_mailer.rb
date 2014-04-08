class WelcomeMailer < ActionMailer::Base
  default from: "potavida@potavida.org"

  def welcome(subscriber_id)
    @subscriber = Subscriber.find(subscriber_id)
    mail(to: @subscriber.email, subject: "Welcome to the PotaVida Mailing List")
  end

end
