class Flight < ApplicationRecord
  belongs_to :depart_city, class_name: "City", foreign_key: "depart_city_id"
  belongs_to :arrive_city, class_name: "City", foreign_key: "arrive_city_id"
  has_many :bookings
  has_many :passengers, through: :bookings
end
