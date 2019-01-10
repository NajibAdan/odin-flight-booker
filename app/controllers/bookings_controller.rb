class BookingsController < ApplicationController
    def new 
        @booking = Booking.new(flight: Flight.find(booking_creation_params[:flight_id]))
        @passenger_num = booking_creation_params[:passengers].to_i
    end
    def create 
        bookings = []
        bookings_params[:passenger_num].to_i.times do |i|
            @booking = Booking.new(flight: Flight.find(bookings_params[:flight_id]),
                        passenger_attributes: {
                            name: passenger_params[:passengers][:"name#{i}"],
                            email: passenger_params[:passengers][:"email#{i}"]
                        }
                    )
            if !passenger_params[:passengers][:"name#{i}"].blank? || @booking.save
                bookings.push(@booking)
                PassengerMailer.with(passenger: @booking).ticket.deliver_now
            else
                render 'new'
            end
        end
        puts bookings
        redirect_to action: "index", bookings: bookings
    end
    def index 
        if !params[:bookings].blank?
            @bookings = Booking.where(id: params[:bookings])
        end
    end
    private 
    def booking_creation_params
        params.require(:picking_flight).permit(:flight_id,:passengers)
    end
    def bookings_params 
        if params[:booking]
            params.require(:booking).permit(:passengers,:passenger_num,:flight_id)
        end
    end
    def passenger_params 
        test = params[:passengers]
        params.require(:booking).permit(:passengers => {})
    end
end
