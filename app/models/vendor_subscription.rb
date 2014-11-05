class VendorSubscription < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :subcategory
  validates :subcategory_id, presence: true, uniqueness: {scrope: :vendor_id}
end
