class Event < ActiveRecord::Base
  scope :name_filter, -> (name) { where("name like ?", "%#{name}%")}
  scope :adress_filter, -> (address) { where("adress like ?", "%#{address}%")}
  scope :description_filter, -> (description) { where("description like ?", "%#{description}%")}
  scope :data_filter, -> (data) { where("data like ?", "%#{data}%")}
  scope :timeStart_filter, -> (timestart) { where("timeStart like ?", "#{timestart}")}


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

  def self.filter_by_data(start_date, end_date)
    if start_date.present?&&end_date.present?
       #binding.pry
      Event.select{|event| event.data.to_date >= start_date.to_date && event.data.to_date <= end_date.to_date}
    elsif start_date.present?
      Event.select{|event| event.data.to_date >= start_date.to_date}
    elsif end_date.present?
      Event.select{|event| event.data.to_date <= end_date.to_date}
    end
  end

end
