class Flight < ApplicationRecord
    belongs_to :origin, class_name: "Airport", foreign_key: "origin_id"
    belongs_to :destination, class_name: "Airport" , foreign_key: "destination_id"
    def Flight.date 
        a = Flight.select(:depature_date).group(:depature_date).map{|u| u.depature_date.strftime("%Y/%m/%d")}
    end
end
