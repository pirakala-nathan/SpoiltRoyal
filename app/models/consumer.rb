class Consumer < ActiveRecord::Base
	has_many :assets, as: :owner, dependent: :destroy
	has_one :user, as: :account
end
