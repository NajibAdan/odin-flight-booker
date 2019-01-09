class FlightsController < ApplicationController
    def index 
        if (!params[:search].nil?)
            @flights = Flight.where(origin: airport(params[:search][:origin]),
                                   destination: airport(params[:search][:destination]),
                                   depature_date: params[:search][:date])
            @passengers = params[:search][:passengers]
        end
       # @search_params = params[:]
    end
    def new 
        @airports = Airport.all.map{ |u| [u.code,u.name]}
    end
end
