class PicturesController < ApplicationController
  def create
  	@picture = Picture.new(picture_params)
    @picture.save
  end

  def index
  	@event = Event.find(params[:id])
  	render 'show'
  end

  def destroy
  	@picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to :action => "user_event_photo", :controller => "users", :id => current_user.id, :event_id => @picture.event_id
  end
end
