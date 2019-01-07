class Airport < ApplicationRecord
    has_many :departing_flights, class_name: 'Flight', foreign_key: 'start_airport'
    has_many :arriving_flights, class_name: "Flight", foreign_key: "finish_airport"
    def Airport.ports
        Airport.all.map{ |u| [u.code]}
    end
end
