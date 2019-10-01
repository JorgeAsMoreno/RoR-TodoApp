class UserMailerJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.welcome_email(user)
  end
end
