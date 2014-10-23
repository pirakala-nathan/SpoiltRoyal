class Vendor < ActiveRecord::Base
  has_one :user, as: :account
  has_many :subcategories, through: :vender_subscriptions
  has_many :physical_locations, dependent: :destroy
  accepts_nested_attributes_for :physical_locations
end
