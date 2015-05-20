module EventsHelper

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
      return 150
    elsif @event.people_count == 'great'
      return 250
    else 
      return nil
    end
  end
    
  
  def confirm_ability(event)
    if (user_signed_in?&&(event.event_type == 'open'||(event.event_type=='close'&&current_user.confirm_friend(event.user.id)))) && event.user != current_user
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
      if (@event.people_count == 'little' && @event.all_participations.count <1)||(@event.people_count == 'middle' && @event.all_participations.count <50)||(@event.people_count == 'great' && @event.all_participations.count <100)
        return true 
      else
        return false 
      end
    elsif @event.reg_type == 'manually'
      if ((@event.people_count == 'little' && @event.all_participations.count <1)||(@event.people_count == 'middle' && @event.all_participations.count <50)||(@event.people_count == 'great' && @event.all_participations.count <100)) && @event.plans.where(status: 'turn').count < 1
        return true 
      else
        return false 
      end
    end
  end

  def user_check_for_availability(event_id)
    if (@event.people_count == 'little' && @event.all_participations.count <2)||(@event.people_count == 'middle' && @event.all_participations.count <50)||(@event.people_count == 'great' && @event.all_participations.count <100)
      return true 
    else
      return false 
    end
  end

  def category_icon(event_id)
    @event = Event.find(event_id)
    @cat = Category.find(@event.category_id)
    if  (@cat.title == 'семья-дети' || @cat.title == 'сім\'я-діти')      
      return "#{image_tag('user-sm-3.jpg')}".html_safe    
    elsif (@cat.title == 'работа' || @cat.title == 'робота')      
      return "#{image_tag('user-sm-1.jpg')}".html_safe
    elsif  (@cat.title == 'домашние животные' || @cat.title == 'домашні улюбленці')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif (@cat.title == 'мови/наука' || @cat.title == 'языка/наука')      
      return "#{image_tag('user-sm-1.jpg')}".html_safe
    elsif  (@cat.title == 'технология' || @cat.title == 'технологія')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'спорт' || @cat.title == 'спорт')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'искусство и ремесла' || @cat.title == 'мистецтво і ремесла')      
      return "#{image_tag('user-sm-4.jpg')}".html_safe
    elsif  (@cat.title == 'кулинария' || @cat.title == 'кулінарія')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'рестораны' || @cat.title == 'ресторани')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'развлечения' || @cat.title == 'розваги')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'музыка' || @cat.title == 'музика')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'bla-bla встречи (полемика)' || @cat.title == 'bla-bla зустрічі (полеміка)')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'путешествия' || @cat.title == 'подорожі')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'для геймеров' || @cat.title == 'для геймерів')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'культурный обмен' || @cat.title == 'культурний обмін')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    elsif  (@cat.title == 'авто/мотолюбители' || @cat.title == 'авто/мотолюбителі')      
      return "#{image_tag('user-sm-2.jpg')}".html_safe
    else
      return nil
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

  def find_plan(id)
    u = current_user
    return u.plans.where(measure_id: id).first
  end
end
