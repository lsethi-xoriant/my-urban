class State < ActiveRecord::Base
  has_many :cities
  has_many :events, through: :cities
end
