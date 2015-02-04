class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id], :status => 'request')
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def resolve
    @friendship = Friendship.find(params[:id])
    @friendship.status = params[:resolve]
    @friendship.save
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if (current_user.id == @friendship.friend_id) && @friendship.status == 'follower'
      @friendship.destroy
    elsif current_user.id == @friendship.user_id #followed user
      @new_friendship = Friendship.create(:friend_id => current_user.id, :user_id => @friendship.friend_id, status: 'follower')
      @friendship.destroy
    elsif current_user.id == @friendship.friend_id #follower
      @friendship.status == 'follower'
      @friendship.save
    end
    flash[:notice] = "Removed friendship."
    redirect_to profile_path
  end
end
