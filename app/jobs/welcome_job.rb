class WelcomeJob
  @queue = :email
  def self.perform
    puts "THIS IS A JOB"
  end
end