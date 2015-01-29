class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :account, polymorphic: true
  has_many :email_notification_settings
  def is_vendor?
    self.account_type == 'Vendor'
  end

  # new user is defined as a registered user that havent created any
  # profiles yet
  def new?
    self.account.nil?
  end
end
