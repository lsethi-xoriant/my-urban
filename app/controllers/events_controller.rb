class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :authorize, :only => [:edit, :update, :destroy]

  before_filter :filter_blank_time, only: [:create, :update]

  respond_to :html

  def index 
    @events = Event.where(nil)
    @state = State.find(params[:state_id]) if params[:state_id]
    params[:state_id] = State.where(:name => params[:state]) if params[:state]
    cities_id = @state.cities.map{|c| c.id}#.pluck[:id]
    @events = Event.where(city_id: cities_id)
    #binding.pry
    filtering_params(params).each do |key, value|
      @events = @events.public_send(key+"_filter", value) if value.present?
    end

    @events = @events.where("name like ?", "%#{params[:search]}%") if params[:search]

    @events = @events.where("date(data) >= ?", "#{1.day.ago.to_date}") unless params[:data]

    @all_events = @events
    @events = @events.order(:data, :timeStart).paginate(:page => params[:page], :per_page => 5)
    @last_date = @all_events.order(:data, :timeStart).paginate(:page => (params[:page].to_i - 1).to_s, :per_page => 5).last.data if params[:page].present?
    if params[:page]
      page = 'index.js.erb'
    else
      page = 'index_ajax.js.erb'
    end
    respond_to do |format|
      format.html { render 'index' }
      format.js   { render page}
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
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
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
    #@event.ensure_than_city_for_event_exists(@event.city_name)
    @users = User.find(params[:invites]) if params[:invites]
    if @event.save
      unless @users.blank? 
        @users.each do |u|
          u.plans.create(measure_id: @event.id, status: 'invite')
        end
      end
      respond_with(@event)
    else
      render 'new'
    end
    #@event.save
    #respond_with(@event)   
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



  def filter_blank_time
    if params[:event]['timeStart(4i)'].blank?
        params[:event]['timeStart(1i)'] = ""
        params[:event]['timeStart(2i)'] = ""
        params[:event]['timeStart(3i)'] = ""
        params[:event]['timeStart(4i)'] = ""
        params[:event]['timeStart(5i)'] = ""
    end
    if params[:event]['endTime(4i)'].blank?
        params[:event]['endTime(1i)'] = ""
        params[:event]['endTime(2i)'] = ""
        params[:event]['endTime(3i)'] = ""
        params[:event]['endTime(4i)'] = ""
        params[:event]['endTime(5i)'] = ""
    end
end



  def upload_picture
    @event = Event.find(params[:id])    
    if params[:commit] == 'Picture'
      # to handle multiple images upload on create      
      if params[:pictures]
        params[:pictures].each { |picture|
          @event.pictures.create(picture: picture)
        }
      end
    end
    render "pictures/create"
  end


  

  private

  def filtering_params(params)
    params.slice( :people_count, :category_id, :event_type, :data, :urban)#(:name, :adress, :description, :data, :timeStart)
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
      :reg_type, :street_number, :street_name, :city_name, :state, :zip_code, :country, :avatar_id, :picture)
  end
end
