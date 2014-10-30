class VendorSubscription < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :subcategory
end
