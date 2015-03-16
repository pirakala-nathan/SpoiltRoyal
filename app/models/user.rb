class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :email
  end
  belongs_to :account, polymorphic: true
  has_one :consumer
  has_many :authentications
  has_many :email_notification_settings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :pictures, as: :owner

  def is_vendor?
    self.account_type == 'Vendor'
  end

  # def apply_omniauth(omniauth)
  
 
  #   # Update user info fetching from social network
  #   case omniauth['provider']
  #     when 'facebook'
  #       self.email = omniauth['info']['email']

  #       # fetch extra user info from facebook
  #     when 'twitter'
  #       # fetch extra user info from twitter
  #   end
  # end

  # new user is defined as a registered user that havent created any
  # profiles yet
  def new?
    self.account.nil?
  end
end
