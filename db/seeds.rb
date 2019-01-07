# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.create(code: 'LND',name: "London")
Airport.create(code: 'LAX',name: "LA")
Airport.create(code: 'JED',name: "Jeddah")
Airport.create(code: 'ELD',name: "Eldoret")
Airport.create(code: 'NRB', name: "Nairobi")
Airport.create(code: 'MBS', name: "Mombasa")

25.times do 
    origin, destination  = Airport.order("RANDOM()").limit(2)
    depart_date = DateTime.parse("01/01/2019") + rand(15).days
    duration = rand(1..36)
    Flight.create(
                origin: origin,
                destination: destination,
                depature_date: depart_date,
                duration: duration
    )
end
