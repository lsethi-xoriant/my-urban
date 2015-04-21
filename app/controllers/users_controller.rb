class UsersController < ApplicationController
	
  def index
    @users = User.all
    render 'user_list'
  end

  def profile    
  end

  def user_events
    @events = Event.all.order(:data, :timeStart).paginate(:page => params[:page], :per_page => 5)
  end

  def user_friends
  end

  def user_info
    @user = User.find(params[:id])    
  end

  def user_photo
  end
end
