class Vendor < ActiveRecord::Base
  has_one :user, as: :account

  has_many :accepted_payment_methods, dependent: :destroy
  has_many :payment_methods, through: :accepted_payment_methods

  has_many :physical_locations, dependent: :destroy
  has_many :vendor_subscriptions, dependent: :destroy
  has_many :delivery_locations, dependent: :destroy
  has_many :external_links, dependent: :destroy
  has_many :assets, dependent: :destroy
  has_many :subcategories, through: :vendor_subscriptions
  has_many :personal_infos, dependent: :destroy

  accepts_nested_attributes_for :physical_locations,
    reject_if: lambda { |a| a[:address].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :vendor_subscriptions,
    reject_if: lambda { |a| a[:subcategory_id].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :delivery_locations,
    reject_if: lambda { |a| a[:city_id].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :external_links,
    reject_if: lambda { |a| a[:link].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :assets,
    allow_destroy: true
  accepts_nested_attributes_for :personal_infos,
    allow_destroy: true
  accepts_nested_attributes_for :accepted_payment_methods,
    allow_destroy: true
end
