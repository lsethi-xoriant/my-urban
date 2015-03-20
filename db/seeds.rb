# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
	require 'securerandom'

=begin
		7.times do
	  Event.create!(
	    :name => "My event #{SecureRandom.hex(2)}",
	    :data => Date.today,
	    :category_id => 1,
	    :user_id => 1,
	    :timeStart => Time.now,
	    :endTime => Time.now,
	    :event_type => 'open',
	    :city_id => 1
	  )
	end
=begin
	states = State.create([{name: 'Ivano-Frankivs\'ka'}, {name: 'Ternopil\'s\'ka'}])
	cities = City.create([{en_name: 'Ivano-Frankivsk', ru_name: 'Ивано-Франковск', ua_name: 'Івано-Франківськ', state_id: states.first.id},{en_name: 'Rakivets', ru_name: 'Раківець', ua_name: 'Раківець', state_id: states.first.id},{en_name: 'Ternopil', ru_name: 'Ternopil', ua_name: 'Тернопіль', state_id: states.last.id}])

states = State.create([
	{name: 'Ivano-Frankivs\'ka'}, 
	{name: 'Ternopil\'s\'ka'}
])
=end
1.times do
	  Event.create!(
	    :name => "My event #{SecureRandom.hex(2)}",
	    :data => Date.today,
	    :category_id => 1,
	    :user_id => 1,
	    :timeStart => Time.now,
	    :endTime => Time.now,
	    :event_type => 'open',
	    :city_id => 1
	  )
	end