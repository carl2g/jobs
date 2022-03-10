class Listing < ApplicationRecord
  
  # Relations
  has_many :missions
  has_many :reservations
  has_many :bookings

  def add_mission(mission_type, mission_date)
    case mission_type
    when Mission::FIRST_CHECKIN, Mission::LAST_CHECKOUT
      Mission.create!(listing_id: self.id, mission_type: mission_type, date: mission_date)
    when Mission::CHECKOUT_CHECKIN
      self.manage_checkout_conflict(mission_type, mission_date)
    else
      raise "Unkown mission"
    end
  end

  def get_mission_type_on_date(mission_type, mission_date)
    return self.missions.find_by(
      mission_type: mission_type,
      date: mission_date
    )
  end

  def manage_checkout_conflict(mission_type, mission_date)
    last_checkout = self.get_mission_type_on_date(Mission::LAST_CHECKOUT, mission_date)

    if last_checkout.nil?
      Mission.create!(listing_id: self.id, mission_type: mission_type, date: mission_date)
    end

  end

end
