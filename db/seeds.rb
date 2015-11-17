# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.where(email: "user@example.org").first_or_create do |u|
  u.password = "password"
  u.password_confirmation = "password"
end

user.api_keys.create if user.api_keys.blank?

puts "User Created: #{user.persisted?}"

admin = User.where(email: "admin@example.org").first_or_create do |u|
  u.password =  "password"
  u.password_confirmation = "password"
  u.admin = true
end

admin.api_keys.create if admin.api_keys.blank?
puts "Admin Created: #{admin.persisted?}"
