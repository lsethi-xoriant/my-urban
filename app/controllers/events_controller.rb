class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :authorize, :only => [:edit, :update, :destroy]

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
    if user_signed_in?
      @p = Plan.where(member_id: current_user.id, measure_id: @event.id)
    else
      @p = 0
    end
    if user_signed_in? && @p.count == 0
      @plan = Plan.new 
    elsif user_signed_in? && @p.count == 1
      @plan = @p.first
    end
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
    @event = Event.find(params[:id])
    if current_user == nil  
      redirect_to root_path
    else
      unless @event.user_id == current_user.id 
        flash[:alert] = "It is not your event"
        redirect_to root_path # or anything you prefer
        return false # Important to let rails know that the controller should not be executed
      end         
    end    
  end

  def filter
    
  end

  def filter_events
    @events = Event.where(nil)
    filtering_params(params).each do |key, value|
      @events = @events.public_send(key+"_filter", value) if value.present?
      #binding.pry
    end
    #binding.pry
    render text: "#{@events.count}"#'filter'
  end

  private

  def filtering_params(params)
    params.slice(:name, :adress, :description)
  end
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
