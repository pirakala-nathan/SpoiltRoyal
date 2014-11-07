class AcceptedPaymentMethod < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :payment_method
end
