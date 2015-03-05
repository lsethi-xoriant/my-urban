class Event < ActiveRecord::Base
  scope :name_filter, -> (name) { where("name like ?", "%#{name}%")}
  scope :adress_filter, -> (address) { where("adress like ?", "%#{address}%")}
  scope :description_filter, -> (description) { where("description like ?", "%#{description}%")}
  scope :data_filter, -> (data) { select{|event| event.data.to_date == data.to_date} }#where("data like ?", "%#{data}%")}
  scope :timeStart_filter, -> (timestart) { where("timeStart like ?", "#{timestart}")}


  belongs_to :user
  belongs_to :category
  belongs_to :city

  has_many :plans, :foreign_key => :measure_id
  has_many :members, through: :plans, source: :member 

  has_many :relationships, -> { where("status like ?", 'come') }, :class_name => "Plan", :foreign_key => :measure_id
  has_many :participations, through: :relationships, source: :member

  has_many :all_relationships, -> { where("status like ? OR status like ?", 'come', 'invite') }, :class_name => "Plan", :foreign_key => :measure_id
  has_many :all_participations, through: :all_relationships, source: :member 


  validates_presence_of :category_id, :name#, :adress, :description, :data, :timeStart, :endTime
  #validates :data , allow_blank: true, format: { with: /\d{2}\.\d{2}\.\d{4}/,
   # message: "only allows data dd.mm.yyyy" }
  #validates :timeStart, :endTime, allow_blank: true, format: { with: /\d{2}:\d{2}/,
   # message: "only allows time format hh:mm" }


  def self.types_of_event
    [['Open event', 'open'], ['Close type', 'close']]
  end


  def self.counts_of_people
    [['Little group', 'little'], ['Middle group', 'middle'], ['Great group', 'great']]
  end

  def self.replenishment
    [['Manually', 'manually'], ['Automatically', 'automatically']]
  end

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end

  def self.people_count_filter(count)
    where("people_count like ?", "%#{count}%")
  end

  def self.category_id_filter(category)
    where("category_id like ?", "%#{category}%")
  end

  def self.event_type_filter(type)
    where("event_type like ?", "%#{type}%")
  end

  def self.state_id_filter(state_id)
    State.find(state_id).events
    #where("state_id like ?", "%#{city_id}%")
  end

  def self.urban_filter(city_id)
    @city = City.where(en_name: city_id).first
    where(city_id: @city.id)
    #where("state_id like ?", "%#{city_id}%")
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

  def self.filter_by_time(start_time, end_time)
    if start_time.present?&&end_time.present?
       #binding.pry
      Event.select{|event| event.timeStart.to_time >= start_time.to_time && event.timeStart.to_time <= end_time.to_time}
    elsif start_time.present?
      Event.select{|event| event.timeStart.to_time >= start_time.to_time}
    elsif end_time.present?
      Event.select{|event| event.timeStart.to_time <= end_time.to_time}
    end
  end

end
