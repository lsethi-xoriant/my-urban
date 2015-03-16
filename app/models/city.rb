class City < ActiveRecord::Base
  translates :en_name
  belongs_to :state
  has_many :events
  has_many :users
end
