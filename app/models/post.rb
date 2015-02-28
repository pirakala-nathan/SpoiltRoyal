class Post < ActiveRecord::Base
  attr_accessor :email

  has_many :post_subscriptions, dependent: :destroy
 	has_many :comments, dependent: :destroy
 	has_many :bids
 	has_many :pictures, as: :owner
 	belongs_to :user
  accepts_nested_attributes_for :post_subscriptions,
    reject_if: lambda { |a| a[:subcategory_id].blank? },
    allow_destroy: true
end
