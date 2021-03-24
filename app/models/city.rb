class City < ApplicationRecord
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arrive_city_id"
  has_many :departing_flights, class_name: "Flight", foreign_key: "depart_city_id"
end
