class Category < ActiveRecord::Base
	has_many :events
	translates :title
end
