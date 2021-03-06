class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validates :body, presence: true, length: { maximum: 500 }
end
