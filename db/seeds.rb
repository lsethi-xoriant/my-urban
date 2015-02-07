# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..30).each do |i|
  Event.create!(name: "Event swim #{i}", adress: "adress event #{i}",
  	description: "description event {i}", data: "02.02.2015",
  	timeStart: "10:20", endTime: "15:00", user_id: "1")
end