class UsersController < ApplicationController
	
  def index
    @users = User.all
    render 'user_list'
  end

  def profile
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
