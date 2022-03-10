class Booking < ApplicationRecord
  belongs_to :listing
  after_create :initialize_missions

  def initialize_missions
    self.listing.add_mission(Mission::FIRST_CHECKIN, self.start_date)
    self.listing.add_mission(Mission::LAST_CHECKOUT, self.end_date)
  end

end
