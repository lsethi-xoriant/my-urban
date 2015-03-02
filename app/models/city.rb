class City < ActiveRecord::Base
  belongs_to :state
  has_many :events
  has_many :users
end
