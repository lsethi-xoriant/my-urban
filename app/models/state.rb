class State < ActiveRecord::Base
  has_many :cities
  has_many :events, through: :cities
  has_many :users, through: :cities
  translates :name
end
