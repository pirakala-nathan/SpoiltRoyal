class DeliveryLocation < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :city
  belongs_to :location_option
  validates :location_option_id, presence: true
end
