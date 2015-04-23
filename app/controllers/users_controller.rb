class UsersController < ApplicationController
  before_action :set_user, only: [:user_events, :user_friends]
	
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
    @friends = @user.user_friends
    @status = 'all_friends'
    if params[:status] == 'common'
      @u_friend = current_user.user_friends
      arr = [];
      @friends.map do |f|
        arr.push f.id
      end
      @friends = @u_friend.select { |f| arr.include?(f.id) }
      @status = 'common'
    end
    respond_to do |format|
      format.html {}
      format.js   {}
    end 
  end

  def user_info
    @user = User.find(params[:id])    
  end

  def user_photo
  end

  private 
    def set_user
      @user = User.find(params[:id])
    end
end
