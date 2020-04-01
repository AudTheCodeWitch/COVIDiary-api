require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

#if Rails.env.development?

  # create Users
  10.times do
    count = 0
    user = User.create! :email => "name#{count}@example.com", :password => 'topsecret', :password_confirmation => 'topsecret'
    user.skip_confirmation!
    user.save!
    count += 1
  end

  User.all do |u|
    # create Profiles
    Profile.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.unique.last_name,
        birthdate: Faker::Date.between(from: 100.years.ago, to: Date.today),
        occupation: Faker::Job.title,
        essential: Faker::Boolean.boolean,
        isolation_start: Faker::Date.between(from: 3.months.ago, to: Date.today),
        about: Faker::Lorem.paragraphs(number: 2),
        user_id: u.id)

    # create 3 entries per user
    3.times do
      Entry.create(
          health_rating: Faker::Number.between(from: 1, to: 5),
          symptoms_present?: Faker::Boolean.boolean,
          health_comments: Faker::Lorem.paragraphs(number: 1),
          mental_health_rating: Faker::Number.between(from: 1, to: 5),
          mental_health_comments: Faker::Lorem.paragraphs(number: 1),
          diary_entry: Faker::Lorem.paragraphs(number: 4),
          user_id: u.id)
    end
  end
# end