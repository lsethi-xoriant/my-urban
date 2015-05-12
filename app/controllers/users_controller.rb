class UsersController < ApplicationController
  before_action :set_user, only: [:user_events, :user_friends, :change_friend_tab]
	
  def index
    @users = User.all
    render 'user_list'
  end

  def profile    
  end

  def user_events
    @events = @user.intent_measures.paginate(:page => params[:page], :per_page => 5)
    @status = 'participation'
    if params[:status] == 'organizer'
      @events = @user.events.paginate(:page => params[:page], :per_page => 5)
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

  def user_event
    @user = User.find(params[:id])
    #@user_event = Event.where(user_id: @user).all
    @user_event = Event.all.where(:user_id => @user.id)
  end

  def user_photo
    #@count_picture = 1
    @user = User.find(params[:id])
  end

  def own_user
    @user = User.find(params[:id])
    @friends = @user.user_friends[0..11]
    @photo_report = @user.events
    render 'index'
  end

  def open_modal
    @avatar = Avatar.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js   {}
    end 
  end

  def change_friend_tab
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
    @friends = @friends[0..11] if @friends.count > 12
    respond_to do |format|
      format.html {}
      format.js   {render 'user_friends.js.erb'}
    end 
  end


  private 
    def set_user
       @user = User.find(params[:id])
    end
end
