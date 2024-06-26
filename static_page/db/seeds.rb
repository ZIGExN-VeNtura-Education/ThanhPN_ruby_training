# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'GOD OF ALL TIMEE',
             email: 'email@email.com',
             password: '123456',
             password_confirmation: '123456',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n}@gmail.com"
  password = '123456'
  password_confirmation = '123456'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password_confirmation,
               activated: true,
               activated_at: Time.zone.now)
end

user = User.order(:created_at).take(6)

50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  user.each { |usr| usr.microposts.create(content: content) }
end
