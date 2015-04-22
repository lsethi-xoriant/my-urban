module CitiesHelper
  def city_name( e_id )
    e = Event.find(e_id)
    l = I18n.locale
    I18n.locale = :en
    c = City.find_by_en_name(e.city_name)
    I18n.locale = l
    name = c.en_name
    return name
  end
end
