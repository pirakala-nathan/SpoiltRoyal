class City < ActiveRecord::Base
  belongs_to :province
  has_many :posts
  has_many :delivery_locations, dependent: :destroy
end
