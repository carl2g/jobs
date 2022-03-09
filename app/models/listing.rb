class Listing < ApplicationRecord
	has_many :missions
	has_many :reservations
	has_many :bookings
end
