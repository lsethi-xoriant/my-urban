class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :plans, :foreign_key => :measure_id
  has_many :members, through: :plans, source: :member 

  validates_presence_of :name, :adress, :description, :data, :timeStart, :endTime
  validates :data , allow_blank: true, format: { with: /\d{2}\.\d{2}\.\d{4}/,
    message: "only allows data dd.mm.yyyy" }
  validates :timeStart, :endTime, allow_blank: true, format: { with: /\d{2}:\d{2}/,
    message: "only allows time format hh:mm" }

  def self.search(query)
      where("data like ?", "%#{query}%") 
  end
end
