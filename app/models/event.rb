class Event < ActiveRecord::Base
	#belong_to :user

	validates_presence_of :name, :adress, :description, :data, :timeStart, :endTime
	validates :data , allow_blank: true, format: { with: /\d{2}\.\d{2}\.\d{4}/,
		message: "only allows data dd.mm.yyyy" }
	validates :timeStart, :endTime, allow_blank: true, format: { with: /\d{2}:\d{2}/,
	  message: "only allows time format hh:mm" }
end
