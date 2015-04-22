class UsersController < ApplicationController
  before_action :set_user, only: [:user_events]
	
  def index
    @users = User.all
    render 'user_list'
  end

  def profile    
  end

  def user_events
    @events = @user.intent_measures.paginate(:page => params[:page], :per_page => 3)
    @status = 'participation'
    if params[:status] == 'organizer'
      @events = @user.events.paginate(:page => params[:page], :per_page => 3)
      @status = 'organizer'
    end
    respond_to do |format|
      format.html {}
      format.js   {}
    end  
  end

  def user_friends
  end

  def user_info
    @user = User.find(params[:id])    
  end

  def user_event
    @user = User.find(params[:id])
    #@user_event = Event.where(user_id: @user).all
    @user_event = Event.all.where(:user_id => @user.id)
  end

  def user_photo
    #@count_picture = 1
    @user = User.find(params[:id])
  end

  private 
    def set_user
       @user = User.find(params[:id])
    end
end
