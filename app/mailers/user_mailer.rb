class UserMailer < ActionMailer::Base
  default from: "test@syncidlabs.com"

  def new_post_email(post, email)
    @post = post
    @email = email
    @url  = 'localhost:3000'
    mail(to: @email, subject: 'Welcome to My Awesome Site')
  end
end