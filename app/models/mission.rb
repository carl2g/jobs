class Mission < ApplicationRecord
  # Relations
  belongs_to :listing

  # Callbacks
  before_save :set_price
  
  # Constant
  FIRST_CHECKIN     = "first_checkin"
  LAST_CHECKOUT     = "last_checkout"
  CHECKOUT_CHECKIN  = "checkout_checkin"

  def unit_price
    case self.mission_type
    when Mission::FIRST_CHECKIN
      10
    when Mission::LAST_CHECKOUT
      5
    when Mission::CHECKOUT_CHECKIN
      10
    else
      raise "Unkown mission"
    end
  end

  def set_price
    self.price = self.listing.num_rooms * self.unit_price
  end

end
