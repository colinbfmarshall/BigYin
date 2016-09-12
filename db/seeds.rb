# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(
  email: 'user1@email.com', 
  password: 'password', 
  password_confirmation: 'password'
)
user.skip_confirmation!
user.save!


topic = Topic.create(title: 'US Presidential Election', description: 'The United States presidential election of 2016, scheduled for Tuesday, November 8, 2016, will be the 58th quadrennial U.S. presidential election.', location: 'United States of America', wikipedia: 'https://en.wikipedia.org/wiki/United_States_presidential_election,_2016', deadline: '08.11.2016')
topic.save!