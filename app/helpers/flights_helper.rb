module FlightsHelper
    def airport(code)
        Airport.find_by(code: code)
    end
end
