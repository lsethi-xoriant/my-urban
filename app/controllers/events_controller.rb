class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :authorize, :only => [:edit, :destroy]

  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
    @event = Event.find(params[:id])
    #unauthorized! if cannot? :edit, @event
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  def authorize
  @event = Event.find(params[:id])
  if current_user == nil  
    redirect_to root_path
  else
  unless @event.user_id == current_user.id 
    flash[:notice] = "You are not the creator of this article, therefore you're not permitted to edit or destroy this article"
    redirect_to root_path # or anything you prefer
    return false # Important to let rails know that the controller should not be executed
  end  
  end
  
end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(
        :name, 
        :adress, 
        :description, 
        :data, 
        :timeStart, 
        :endTime, 
        :photo,
        :user_id)
    end
end
