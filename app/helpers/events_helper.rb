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

  def categories_collection
    Category.all.map {|c| ["#{c.title} #{Event.where(category_id: c.id).count}", c.id]}
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
    if (user_signed_in?&&(event.event_type == 'open'||(event.event_type=='close'&&current_user.confirm_friend(event.user.id))))
      return 'can'
    elsif (user_signed_in?&&(event.event_type == 'open'||(event.event_type=='close'&&!current_user.confirm_friend(event.user.id))))
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
end
