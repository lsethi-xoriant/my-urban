class UsersController < ApplicationController
	
  def index
    @users = User.all
    render 'user_list'
  end

  def profile    
  end

  def user_events
    @events = current_user.intent_measures.paginate(:page => params[:page], :per_page => 3)
    @status = 'participation'
    if params[:status] == 'organizer'
      @events = current_user.events.paginate(:page => params[:page], :per_page => 3)
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

  def user_photo
  end
end
