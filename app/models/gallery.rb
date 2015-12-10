class Gallery < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  has_many :attachments, as: :owner, dependent: :destroy
  belongs_to :user
end
