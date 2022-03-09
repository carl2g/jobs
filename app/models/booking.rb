class Booking < ApplicationRecord
  belongs_to :listing
  after_create :add_first_checkin_mission

  # def add_first_checkin_mission
  #   Mission.create!(listing_id: self.listing_id)
  # end

end
