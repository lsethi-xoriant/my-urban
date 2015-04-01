class Picture < ActiveRecord::Base
	#photo belongs to event
	belongs_to	:event
	#validations
	validates 	:event, presence: true
	# Photo uploader using carrierwave
    mount_uploader :picture, PictureUploader
end
