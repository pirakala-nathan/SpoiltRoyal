class UserMailer < ActionMailer::Base
  default from: "no-reply@nathansexchange.com"

  def new_post_email(post, email)
    @post = post
    @email = email
    @url  = 'localhost:3000'
    mail(to: @email, subject: 'Welcome to My Awesome Site')
  end

  def new_user_welcome(user)
    @user = user
    @email = user.email
    @url  = 'localhost:3000'
    mail(to: @email, subject: 'Welcome to NEX!')
  end

  def reset_password(user, new_pw)
    @user = user
    @new_pw = new_pw
    @email = user.email
    @url  = 'localhost:3000'
    mail(to: @email, subject: 'Password Reset')
  end
end
