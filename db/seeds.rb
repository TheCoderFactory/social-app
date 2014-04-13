# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' },
  { :name => 'moderator' }
])
puts 'SETTING UP DEFAULT USER LOGIN'
user5 = User.create! :email => 'user5@example.com', :password => 'pleaseme', :password_confirmation => 'pleaseme'
puts 'New user created: ' << user5.email
user2 = User.create! :email => 'user2@example.com', :password => 'pleaseme', :password_confirmation => 'pleaseme'
puts 'New user created: ' << user2.email
user5.add_role :admin
user2.add_role :user