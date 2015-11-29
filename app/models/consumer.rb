class Consumer < ActiveRecord::Base
	has_many :assets, as: :owner, dependent: :destroy
	has_one :user, as: :account

	accepts_nested_attributes_for :assets,
    allow_destroy: true
end
