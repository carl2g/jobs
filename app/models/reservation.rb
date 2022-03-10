class Reservation < ApplicationRecord
  belongs_to :listing

  after_create :initialize_missions

  def initialize_missions
    self.listing.add_mission(Mission::CHECKOUT_CHECKIN, self.end_date)
  end

end
