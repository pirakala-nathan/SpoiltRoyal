class Gallery < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  has_many :assets, as: :owner, dependent: :destroy
  belongs_to :user
end
