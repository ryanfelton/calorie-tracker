# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include FactoryGirl::Syntax::Methods


user = User.where(email: "user@example.org").first_or_create do |u|
  u.password = "password"
  u.password_confirmation = "password"
end
ApiKey.where(api_key: "1777e161a7a07d79e18ba0fc0311e904").first_or_create(user: user)

FactoryGirl.create(:meal, user: user)
FactoryGirl.create(:meal, user: user)
FactoryGirl.create(:meal, user: user)


user2 = User.where(email: "user2@example.org").first_or_create do |u|
  u.password = "password"
  u.password_confirmation = "password"
end
ApiKey.where(api_key: "9a4545ffff5000e1807dc27feb48178c").first_or_create(user: user2)

FactoryGirl.create(:meal, user: user2)
FactoryGirl.create(:meal, user: user2)
FactoryGirl.create(:meal, user: user2)


admin = User.where(email: "admin@example.org").first_or_create do |u|
  u.password =  "password"
  u.password_confirmation = "password"
  u.admin = true
end
ApiKey.where(api_key: "1d08c99f401876cc29a6880d400f7750").first_or_create(user: admin)
