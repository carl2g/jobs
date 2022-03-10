class Booking < ApplicationRecord
  belongs_to :listing
  after_create :add_mission

  def add_first_checkin_mission
    self.listing.add_mission(self, Mission::FIRST_CHECKIN)
    self.listing.add_mission(self, Mission::LAST_CHECKOUT)
  end

end
