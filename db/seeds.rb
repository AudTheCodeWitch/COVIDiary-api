require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 10 Users
10.times do

  user = User.create(
      email: Faker::Internet.safe_email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.unique.last_name,
      birth_date: Faker::Date.between(from: 100.years.ago, to: Date.today),
      occupation: Faker::Job.title,
      is_essential: Faker::Boolean.boolean,
      isolation_start: Faker::Date.between(from: 3.months.ago, to: Date.today),
      about: Faker::Lorem.paragraphs(number: 2))

  # create 3 diary Entries for user
  3.times do
    Entry.create(
        health_rating: Faker::Number.between(from: 1, to: 5),
        is_symptomatic: Faker::Boolean.boolean,
        is_public: Faker::Boolean.boolean,
        health_comments: Faker::Lorem.paragraphs(number: 1),
        mental_health_rating: Faker::Number.between(from: 1, to: 5),
        mental_health_comments: Faker::Lorem.paragraphs(number: 1),
        diary_entry: Faker::Lorem.paragraphs(number: 4),
        user_id: user.id)
  end
end