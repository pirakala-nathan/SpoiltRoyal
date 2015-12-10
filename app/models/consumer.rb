class Consumer < ActiveRecord::Base
  has_many :galleries, as: :owner, dependent: :destroy
	has_one :user, as: :account

end
