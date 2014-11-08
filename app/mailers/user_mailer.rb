class UserMailer < ActionMailer::Base
  default from: "no-reply@nathansexchange.com"

  def new_post_email(post, email)
    @post = post
    @email = email
    @url  = 'localhost:3000'
    mail(to: @email, subject: 'Welcome to My Awesome Site')
  end
end
