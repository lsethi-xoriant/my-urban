# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
	require 'securerandom'

	7.times do
	  Event.create!(
	    :name => "My event #{SecureRandom.hex(2)}",
	    :data => 2.day.ago,
	    :category_id => 1,
	    :user_id => 1,
	    :timeStart => Time.now,
	    :endTime => Time.now,
	    :event_type => 'open'
	  )
	end