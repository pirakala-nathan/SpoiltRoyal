class PostSubscription < ActiveRecord::Base
  belongs_to :post
  belongs_to :subcategory
  validates :subcategory_id, presence: true, uniqueness: {scrope: :post_id}
end
