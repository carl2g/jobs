class Booking < ApplicationRecord

  # Relations
  belongs_to :listing

  # Callbacks
  after_create :initialize_missions

  def initialize_missions
    self.listing.add_mission(Mission::FIRST_CHECKIN, self.start_date)
    self.listing.add_mission(Mission::LAST_CHECKOUT, self.end_date)
  end

end
