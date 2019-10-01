# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    @user = User.find_by id:'33'
    UserMailer.welcome_email(@user)
  end
end

