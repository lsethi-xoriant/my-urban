module EventsHelper
  def categories_collection
    Category.all.map {|c| ["#{c.title} #{Event.where(category_id: c.id).count}", c.id]}
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
