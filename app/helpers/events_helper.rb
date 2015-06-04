module EventsHelper
    def include_i18n_calendar_javascript
      content_for :head do
        javascript_include_tag case I18n.locale
          when :ru then "jquery.ui.datepicker-ru.js"
          when :uk then "jquery.ui.datepicker-uk.js"
          else raise ArgumentError, "Locale error"
        end
      end
    end

  def case_of_event(count)
    if count == 1
      t('case_of_event.one')
    elsif count<=4&&count>1
      t('case_of_event.few')
    elsif count>=5&&count<21
      t('case_of_event.many')
    elsif count>=21&&count%10 == 1
      t('case_of_event.one')
    elsif count>=22&&(count%10 == 2 || count%10 == 3 || count%10 == 4)
      t('case_of_event.few')    
    else
      t('case_of_event.many')
    end
  end

  def case_of_member(count)
    if count == 1
      t('case_of_member.one')
    elsif count<=4&&count>1
      t('case_of_member.few')
    elsif count>=5&&count<21
      t('case_of_member.many')
    elsif count>=21&&count%10 == 1
      t('case_of_member.one')
    elsif count>=22&&(count%10 == 2 || count%10 == 3 || count%10 == 4)
      t('case_of_member.few')    
    else
      t('case_of_member.many')
    end
  end

  def categories_collection
    Category.all.map {|c| ["#{c.title} #{Event.where(category_id: c.id).where('data >= ?', Date.today).count}", c.id]}
  end

  def number_format_people_count(event_id)
    @event = Event.find(event_id)
    if @event.people_count == 'little'
      return 15
    elsif @event.people_count == 'middle'
      return 25
    elsif @event.people_count == 'great'
      return 50
    else 
      return nil
    end
  end
    
  
  def confirm_ability(event)
    if user_signed_in?&& current_user.are_invited(event.id)
      return 'already_invited'
    elsif (user_signed_in?&&(event.event_type == 'open'||(event.event_type=='close'&&current_user.confirm_friend(event.user.id)))) && event.user != current_user
      return 'can'
    elsif (user_signed_in?&&(event.event_type == 'open'||(event.event_type=='close'&&!current_user.confirm_friend(event.user.id)))) && event.user != current_user
      return 'not_friend'
    elsif !user_signed_in?
      return 'not_user'
    end
  end

  def check_for_availability(event_id)
    @event = Event.find(event_id)
    if @event.reg_type == 'automatically'
      if (@event.people_count == 'little' && @event.participations.count <15)||(@event.people_count == 'middle' && @event.participations.count <50)||(@event.people_count == 'great' && @event.participations.count <100)
        return true 
      else
        return false 
      end
    elsif @event.reg_type == 'manually'
      if ((@event.people_count == 'little' && @event.participations.count <15)||(@event.people_count == 'middle' && @event.participations.count <50)||(@event.people_count == 'great' && @event.participations.count <100)) && @event.plans.where(status: 'turn').count < 1
        return true 
      else
        return false 
      end
    end
  end

  def user_check_for_availability(event_id)
    if (@event.people_count == 'little' && @event.participations.count <15)||(@event.people_count == 'middle' && @event.participations.count <50)||(@event.people_count == 'great' && @event.participations.count <100)
      return true 
    else
      return false 
    end
  end

  def category_icon(event_id)
    @event = Event.find(event_id)
    @cat = Category.find(@event.category_id)
    if  (@cat.title == 'семья-дети' || @cat.title == 'сім\'я-діти')      
      return "#{image_tag('family-children.png')}".html_safe    
    elsif (@cat.title == 'студенты' || @cat.title == 'студенти')      
      return "#{image_tag('student.png')}".html_safe
    elsif (@cat.title == 'работа' || @cat.title == 'робота')      
      return "#{image_tag('business.png')}".html_safe
    elsif  (@cat.title == 'домашние животные' || @cat.title == 'домашні улюбленці')      
      return "#{image_tag('pets.png')}".html_safe
    elsif (@cat.title == 'мови/наука' || @cat.title == 'языка/наука')      
      return "#{image_tag('languages-science.png')}".html_safe
    elsif  (@cat.title == 'технология' || @cat.title == 'технологія')      
      return "#{image_tag('technologies.png')}".html_safe
    elsif  (@cat.title == 'спорт' || @cat.title == 'спорт')      
      return "#{image_tag('sport.png')}".html_safe
    elsif  (@cat.title == 'искусство и ремесла' || @cat.title == 'мистецтво і ремесла')      
      return "#{image_tag('arts-crafts.png')}".html_safe
    elsif  (@cat.title == 'кулинария' || @cat.title == 'кулінарія')      
      return "#{image_tag('cooking.png')}".html_safe
    elsif  (@cat.title == 'рестораны' || @cat.title == 'ресторани')      
      return "#{image_tag('restaurants.png')}".html_safe
    elsif  (@cat.title == 'развлечения' || @cat.title == 'розваги')      
      return "#{image_tag('entertainment.png')}".html_safe
    elsif  (@cat.title == 'музыка' || @cat.title == 'музика')      
      return "#{image_tag('music.png')}".html_safe
    elsif  (@cat.title == 'bla-bla встречи (полемика)' || @cat.title == 'bla-bla зустрічі (полеміка)')      
      return "#{image_tag('bla-bla_meetings.png')}".html_safe
    elsif  (@cat.title == 'путешествия' || @cat.title == 'подорожі')      
      return "#{image_tag('travels.png')}".html_safe
    elsif  (@cat.title == 'для геймеров' || @cat.title == 'для геймерів')      
      return "#{image_tag('for_gamers.png')}".html_safe
    elsif  (@cat.title == 'культурный обмен' || @cat.title == 'культурний обмін')      
      return "#{image_tag('cultural_exchange.png')}".html_safe
    elsif  (@cat.title == 'авто/мотолюбители' || @cat.title == 'авто/мотолюбителі')      
      return "#{image_tag('auto/moto.png')}".html_safe
    else
      return nil
    end
  end

  def small_event_image(event_id)
    @event = Event.find(event_id)
    @cat = Category.find(@event.category_id)
    if  (@cat.title == 'семья-дети' || @cat.title == 'сім\'я-діти')      
      return "#{image_tag('default_family-children_event.png')}".html_safe    
    elsif (@cat.title == 'студенты' || @cat.title == 'студенти')      
      return "#{image_tag('default_student_event.png')}".html_safe
    elsif (@cat.title == 'работа' || @cat.title == 'робота')      
      return "#{image_tag('default_business_event.png')}".html_safe
    elsif  (@cat.title == 'домашние животные' || @cat.title == 'домашні улюбленці')      
      return "#{image_tag('default_pets_event.png')}".html_safe
    elsif (@cat.title == 'мови/наука' || @cat.title == 'языка/наука')      
      return "#{image_tag('default_languages-science_event.png')}".html_safe
    elsif  (@cat.title == 'технология' || @cat.title == 'технологія')      
      return "#{image_tag('default_technologies_event.png')}".html_safe
    elsif  (@cat.title == 'спорт' || @cat.title == 'спорт')      
      return "#{image_tag('default_sport_event.png')}".html_safe
    elsif  (@cat.title == 'искусство и ремесла' || @cat.title == 'мистецтво і ремесла')      
      return "#{image_tag('default_arts-crafts_event.png')}".html_safe
    elsif  (@cat.title == 'кулинария' || @cat.title == 'кулінарія')      
      return "#{image_tag('default_cooking_event.png')}".html_safe
    elsif  (@cat.title == 'рестораны' || @cat.title == 'ресторани')      
      return "#{image_tag('default_restaurants_event.png')}".html_safe
    elsif  (@cat.title == 'развлечения' || @cat.title == 'розваги')      
      return "#{image_tag('default_entertainment_event.png')}".html_safe
    elsif  (@cat.title == 'музыка' || @cat.title == 'музика')      
      return "#{image_tag('default_music_event.png')}".html_safe
    elsif  (@cat.title == 'bla-bla встречи (полемика)' || @cat.title == 'bla-bla зустрічі (полеміка)')      
      return "#{image_tag('default_bla-bla_meetings_event.png')}".html_safe
    elsif  (@cat.title == 'путешествия' || @cat.title == 'подорожі')      
      return "#{image_tag('default_travels_event.png')}".html_safe
    elsif  (@cat.title == 'для геймеров' || @cat.title == 'для геймерів')      
      return "#{image_tag('default_for_gamers_event.png')}".html_safe
    elsif  (@cat.title == 'культурный обмен' || @cat.title == 'культурний обмін')      
      return "#{image_tag('default_cultural_exchange_event.png')}".html_safe
    elsif  (@cat.title == 'авто/мотолюбители' || @cat.title == 'авто/мотолюбителі')      
      return "#{image_tag('default_auto/moto_event.png')}".html_safe
    end
  end

  def default_background_event(event_id)
    @event = Event.find(event_id)
    @cat = Category.find(@event.category_id)
    if  (@cat.title == 'семья-дети' || @cat.title == 'сім\'я-діти')      
      return "#{image_tag('default_background_family-children_event.jpg')}".html_safe    
    elsif (@cat.title == 'студенты' || @cat.title == 'студенти')      
      return "#{image_tag('default_background_student_event.jpg')}".html_safe
    elsif (@cat.title == 'работа' || @cat.title == 'робота')      
      return "#{image_tag('default_background_business_event.jpg')}".html_safe
    elsif  (@cat.title == 'домашние животные' || @cat.title == 'домашні улюбленці')      
      return "#{image_tag('default_background_pets_event.jpg')}".html_safe
    elsif (@cat.title == 'мови/наука' || @cat.title == 'языка/наука')      
      return "#{image_tag('default_background_languages-science_event.jpg')}".html_safe
    elsif  (@cat.title == 'технология' || @cat.title == 'технологія')      
      return "#{image_tag('default_background_technologies_event.jpg')}".html_safe
    elsif  (@cat.title == 'спорт' || @cat.title == 'спорт')      
      return "#{image_tag('default_background_sport_event_event.jpg')}".html_safe
    elsif  (@cat.title == 'искусство и ремесла' || @cat.title == 'мистецтво і ремесла')      
      return "#{image_tag('default_background_arts-crafts_event.jpg')}".html_safe
    elsif  (@cat.title == 'кулинария' || @cat.title == 'кулінарія')      
      return "#{image_tag('default_background_cooking_event.jpg')}".html_safe
    elsif  (@cat.title == 'рестораны' || @cat.title == 'ресторани')      
      return "#{image_tag('default_background_restaurants_event.jpg')}".html_safe
    elsif  (@cat.title == 'развлечения' || @cat.title == 'розваги')      
      return "#{image_tag('default_background_entertainment_event.jpg')}".html_safe
    elsif  (@cat.title == 'музыка' || @cat.title == 'музика')      
      return "#{image_tag('defalt_background_music_event_event.jpg')}".html_safe
    elsif  (@cat.title == 'bla-bla встречи (полемика)' || @cat.title == 'bla-bla зустрічі (полеміка)')      
      return "#{image_tag('default_background_bla-bla_meetings_event.jpg')}".html_safe
    elsif  (@cat.title == 'путешествия' || @cat.title == 'подорожі')      
      return "#{image_tag('default_background_travels_event.jpg')}".html_safe
    elsif  (@cat.title == 'для геймеров' || @cat.title == 'для геймерів')      
      return "#{image_tag('default_background_for_gamers_event.jpg')}".html_safe
    elsif  (@cat.title == 'культурный обмен' || @cat.title == 'культурний обмін')      
      return "#{image_tag('default_background_cultural_exchange_event.jpg')}".html_safe
    elsif  (@cat.title == 'авто/мотолюбители' || @cat.title == 'авто/мотолюбителі')      
      return "#{image_tag('default_background_auto/moto_event.jpg')}".html_safe
    end    
  end

  def translate_status(status)
    if status == 'invite'
      return I18n.t('event.invate') 
    elsif status == 'turn'
      return I18n.t('event.turn') 
    elsif status == 'come'
      return I18n.t('event.come') 
    end
  end

  def icon_of_status(status)
    if status == 'invite'
      return  "#{image_tag('invite.png')}".html_safe  
    elsif status == 'turn'
      return  "#{image_tag('turn.png')}".html_safe 
    elsif status == 'come'
      return  "#{image_tag('come.png')}".html_safe 
    end
  end

  def find_plan(user_id, plan_id)
    u = User.find(user_id)
    return u.plans.where(measure_id: plan_id).first
  end
end
