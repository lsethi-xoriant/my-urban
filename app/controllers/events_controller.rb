class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :authorize, :only => [:edit, :update, :destroy]

  respond_to :html

  def index 
    @events = Event.where(nil)
    params[:state_id] = State.where(:name => params[:state]) if params[:state]
    filtering_params(params).each do |key, value|
      @events = @events.public_send(key+"_filter", value) if value.present?
    end
    @events = Event.all if !@event.blank?
    #binding.pry
=begin
    if params[:search]
      @events = Event.search(params[:search]).order(:data, :timeStart).page(params[:page]).per(5)
    else
      @nowDate = Date.today
      #@events = Event.where("data >= ?", @nowDate).order(:data, :timeStart).page(params[:page]).per(5)
      @events = Event.order(:data, :timeStart).page(params[:page]).per(5)
    end
=end
    #binding.pry
    @events = @events.paginate(:page => params[:page], :per_page => 5)
    @last_date = Event.order(:data, :timeStart).paginate(:page => (params[:page].to_i - 1).to_s, :per_page => 5).last.data if params[:page].present?
    respond_to do |format|
      format.html { render 'index1' }
      format.js   { render 'index.js.erb'}
    end   
  end

  def show
    #@event = Event.find(params[:id])
    if user_signed_in?
      @p = Plan.where(member_id: current_user.id, measure_id: @event.id)
    else
      @p = Plan.where(reg_type: "nobody")
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
    #@events = @events.filter_by_count(params[:people_count]) if params[:people_count].present?
    @events = @events.filter_by_data(params[:start_date], params[:end_date] ) if params[:end_date].present?||params[:start_date].present?
    @events = @events.filter_by_time(params[:start_time], params[:end_time] ) if params[:end_time].present?||params[:start_time].present?
    #binding.pry
    render 'index'#text: "#{@events.count}"#'filter'
  end

  private

  def filtering_params(params)
    params.slice(:state_id, :people_count, :category_id, :event_type, :data, :urban)#(:name, :adress, :description, :data, :timeStart)
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
      :category_id,
      :event_type,
      :people_count,
      :reg_type)
  end
end
