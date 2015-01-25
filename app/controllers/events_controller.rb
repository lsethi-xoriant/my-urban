class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :authorize, :only => [:edit, :destroy]

  respond_to :html

  def index
    if params[:search]
    @events = Event.search(params[:search]).order("created_at DESC")
  else
    @events = Event.all
  end
    #@events = Event.all
    respond_with(@events)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    if current_user == nil  
      redirect_to root_path
    else
      @event = Event.new
      respond_with(@event)
    end
  end

  def edit
    if current_user == nil  
      redirect_to root_path
    else
      @event = Event.find(params[:id])
    #unauthorized! if cannot? :edit, @event
    end
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)   
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  def authorize  
    if current_user == nil  
      redirect_to root_path
    else
      unless @event.user_id == current_user.id 
        flash[:alert] = "It is not your event"
        redirect_to root_path # or anything you prefer
        return false # Important to let rails know that the controller should not be executed
      end 
        @event = Event.find(params[:id]) 
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
        :user_id,
        :category_id)
    end
end
