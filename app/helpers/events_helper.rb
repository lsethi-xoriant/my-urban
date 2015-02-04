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
end
