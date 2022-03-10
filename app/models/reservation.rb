class Reservation < ApplicationRecord
  # Relations
  belongs_to :listing

  # Scope
  scope :overlapping_reservations, -> (start_date, end_date){ where("(start_date < ? AND ? < end_date) OR (start_date < ? AND ? < end_date)", start_date, start_date, end_date, end_date) }
  
  # Callbacks
  after_create :initialize_missions
  
  # Validations could / should be in a validation module
  validate do |reservation|
    reservation.in_booking_range
    reservation.check_overlapping_reservations
  end

  def initialize_missions
    self.listing.add_mission(Mission::CHECKOUT_CHECKIN, self.end_date)
  end

  def check_overlapping_reservations
    if self.listing.reservations.overlapping_reservations(self.start_date, self.end_date).count > 0
      self.errors.add(:base, "Overlapping reservation date")
    end
  end

  def in_booking_range
    if self.listing.bookings.where("start_date <= ? AND ? <= end_date ", self.start_date, self.end_date).count == 0
      self.errors.add(:base, "Is not in any booking range")
    end
  end

end
