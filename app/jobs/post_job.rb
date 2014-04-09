class PostJob
  @queue = :email

  def self.perform(subscriber_id, post_id)
    PostMailer.new_post(subscriber_id, post_id).deliver
  end
end