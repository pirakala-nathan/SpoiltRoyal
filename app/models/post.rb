class Post < ActiveRecord::Base
  attr_accessor :email

  has_many :post_subscriptions, dependent: :destroy
 	has_many :comments, dependent: :destroy
  has_many :watched_posts, dependent: :destroy 
 	has_many :bids
  has_many :pictures, as: :owner
  has_many :assets, as: :owner, dependent: :destroy
 	belongs_to :user
  has_many :accepted_payment_methods, dependent: :destroy
  has_many :payment_methods, through: :accepted_payment_methods
  accepts_nested_attributes_for :post_subscriptions,
    reject_if: lambda { |a| a[:subcategory_id].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :accepted_payment_methods,
    allow_destroy: true
end
