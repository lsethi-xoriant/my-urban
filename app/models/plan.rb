class Plan < ActiveRecord::Base
  belongs_to :member,  :class_name => "User" 
  belongs_to :measure, :class_name => "Event" 
end
