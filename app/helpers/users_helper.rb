module UsersHelper
  def user_events(id)
    u = User.find(id)
    return u.plans.where('status =? OR status = ? OR status = ?', 'come', 'turn', 'invite')
  end
end
