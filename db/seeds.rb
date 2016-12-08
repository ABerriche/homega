# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Provider.destroy_all

5.times do
  Provider.create!(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  address: Faker::Address.street_address,
                  zip_code: Faker::Address.zip,
                  city: Faker::Address.city,
                  company:Faker::Company.name,
                  category: "Dégât des eaux",
                  speciality: "Plomberie")
  Provider.create!(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  address: Faker::Address.street_address,
                  zip_code: Faker::Address.zip,
                  city: Faker::Address.city,
                  company:Faker::Company.name,
                  category: "Incendie",
                  speciality: "Peinture")
end
