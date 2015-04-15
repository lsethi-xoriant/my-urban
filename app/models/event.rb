class Event < ActiveRecord::Base
  scope :name_filter, -> (name) { where("name like ?", "%#{name}%")}
  scope :adress_filter, -> (address) { where("adress like ?", "%#{address}%")}
  scope :description_filter, -> (description) { where("description like ?", "%#{description}%")}
  scope :data_filter, -> (data) { where("date(data) >= ?", "#{data.to_date}")}#{|event| event.data.to_date == data.to_date} }#where("data like ?", "%#{data}%")}
  scope :timeStart_filter, -> (timestart) { where("timeStart like ?", "#{timestart}")}


  belongs_to :user
  belongs_to :category
  belongs_to :city
  belongs_to :avatar
  
  has_many :plans, :foreign_key => :measure_id
  has_many :members, through: :plans, source: :member 

  has_many :relationships, -> { where("status like ?", 'come') }, :class_name => "Plan", :foreign_key => :measure_id
  has_many :participations, through: :relationships, source: :member

  has_many :all_relationships, -> { where("status like ? OR status like ?", 'come', 'invite') }, :class_name => "Plan", :foreign_key => :measure_id
  has_many :all_participations, through: :all_relationships, source: :member 



  validates_presence_of :name, :category_id, :description, :adress, :data, :timeStart, :endTime, :people_count, :reg_type
  #validates :data , allow_blank: true, format: { with: /\d{2}\.\d{2}\.\d{4}/,
   # message: "only allows data dd.mm.yyyy" }
  #validates :timeStart, :endTime, allow_blank: true, format: { with: /\d{2}:\d{2}/,
   # message: "only allows time format hh:mm" }

  before_validation :ensure_than_city_for_event_exists

  geocoded_by :adress   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates


  def self.types_of_event
    [['Open event', 'open'], ['Close type', 'close']]
  end


  def self.counts_of_people
    [[I18n.t('events.little_group'), 'little'], [I18n.t('events.middle_group'), 'middle'], [I18n.t('events.great_group'), 'great']]
  end

  def self.replenishment
    [[I18n.t('events.manually'), 'manually'], [I18n.t('events.automatically'), 'automatically']]
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
    if @city.nil?
      where(nil)
    else
      where(city_id: @city.id)
    end
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

  def ensure_than_city_for_event_exists
    locale = I18n.locale 
    I18n.locale = :en
    I18n.locale = 'en'
    self.city_name = 'Ivano-Frankivsk' if self.city_name == 'Ivano-Frankivs\'k'
    unless City.where(en_name: self.city_name).exists?
      self.errors[:adress] << I18n.t('my_errors.messages.incorrect_city')
    else
      city = City.where(en_name: self.city_name).first
      self.city_id = city.id
    end
    I18n.locale = locale
  end

end
