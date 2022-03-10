class Reservation < ApplicationRecord
  belongs_to :listing

  after_create :initialize_missions
  validate :in_booking_range

  def initialize_missions
    self.listing.add_mission(Mission::CHECKOUT_CHECKIN, self.end_date)
  end

  def in_booking_range
    if self.listing.bookings.where("start_date <= ? AND ? <= end_date ", self.start_date, self.end_date).count == 0
      self.errors.add(:base, "Is not in any booking range")
    end
  end

end
