module UsersHelper
  def user_events(id)
    u = User.find(id)
    return u.plans.where('status =? OR status = ? OR status = ?', 'come', 'turn', 'invite')
  end

  def user_age(user_id)
    @user = User.find(user_id)
    @date = Date.current
    if @date.yday > @user.birthday.yday
      return (@date.year - @user.birthday.year)
    else 
      return (@date.year - @user.birthday.year)-1
    end
  end

  def case_of_age(count)
    if count == 1
      t('case_of_age.one')
    elsif count<=4&&count>1
      t('case_of_age.few')
    elsif count>=5&&count<21
      t('case_of_age.many')
    elsif count>=21&&count%10 == 1
      t('case_of_age.one')
    elsif count>=22&&(count%10 == 2 || count%10 == 3 || count%10 == 4)
      t('case_of_age.few')    
    else
      t('case_of_age.many')
    end
  end

  def user_gender(user_id)
  	user_gender = User.find(user_id).gender
  	if user_gender == 'man'
  		t('other_user.man')
  	elsif user_gender == 'woman'
  		t('other_user.woman')
	  end
  end

  def small_avatar(id)
    u = User.find(id)
    avatar = (u.avatar && u.avatar.avatar.file.exists?) ? u.avatar.avatar_url(:small) : "user-sm-1.jpg"
    return "#{image_tag avatar}".html_safe 
  end

  def find_friendship(id)
    u = current_user
    friendship = u.friendships.where(status: 'friend', friend_id: id) if u.friendships.where(status: 'friend', friend_id: id).count > 0
    friendship = u.inverse_friendships.where(status: 'friend', user_id: id) if u.inverse_friendships.where(status: 'friend', user_id: id).count > 0
    return friendship.first
  end

  def find_followship(id)
    return current_user.follower_friendships.where(user_id: id).first
  end
end
