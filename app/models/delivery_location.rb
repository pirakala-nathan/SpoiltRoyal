class DeliveryLocation < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :city
  validates :city_id, presence: true
end
