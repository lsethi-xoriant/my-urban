class UsersController < ApplicationController
	
  def index
    @users = User.all
  end

  def profile
    render 'user-events'
  end

  def user_events
  end

  def user_friends
  end

  def user_info
  end

  def user_photo
  end
end
