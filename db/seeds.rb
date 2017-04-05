# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Sensor.create(
    voltage: Faker::Number.between(from = 0.00, to = 6.00),
    moisture: Faker::Number.between(from = 0.00, to = 1200.00),
    time: Faker::Date.forward(days = 365)
  )
end
