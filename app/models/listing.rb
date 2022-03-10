class Listing < ApplicationRecord
  has_many :missions
  has_many :reservations
  has_many :bookings

  def add_mission(obj, mission_type)
    case mission_type
    when Mission::FIRST_CHECKIN
      Mission.create!(listing_id: self.id, name: mission_type)
    when Mission::LAST_CHECKOUT
      self.manage_checkout_conflict(obj)
    end
  end

  def manage_checkout_conflict(obj)
    # self.joins(:reservations, :bookings).where(bookings: {end_date: obj.end_date}, reservations: {end_date: obj.end_date})
  end

end
