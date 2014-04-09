class PostMailer < ActionMailer::Base
  default from: "potavida@potavida.org"

  def new_post(subscriber_id, post_id)
    @post = Post.find(post_id)
    @subscriber = Subscriber.find(subscriber_id)
    mail(to: @subscriber.email, subject: "Update from PotaVida")
  end

end
