class Mission < ApplicationRecord
  belongs_to :listing

  FIRST_CHECKIN     = "first_checkin"
  LAST_CHECKOUT     = "last_checkout"
  CHECKOUT_CHECKIN  = "checkout_checkin"
end
