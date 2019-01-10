class PassengerMailer < ApplicationMailer
    default from: 'no-reply@example.com'

    def ticket
        @passenger = params[:passenger].passenger
        @booking = params[:passenger]
        mail(to: @passenger.email,subject: "Thanks for booking")
    end
end
