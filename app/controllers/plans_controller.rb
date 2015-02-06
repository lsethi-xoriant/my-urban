class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @plans = Plan.all
    respond_with(@plans)
  end

  def show
    respond_with(@plan)
  end

  def new
    @plan = Plan.new
    respond_with(@plan)
  end

  def edit
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.member_id = current_user.id
    if params[:not_comming]
      @plan.destroy
    elsif params[:comming]
      @plan.status = 'comming'
    elsif params[:maybe]
      @plan.status = 'maybe'
     elsif params[:turn]
      @plan.status = 'turn'
      @plan.turn_number = 1
      @plan.turn_number = Plan.where(status: 'turn').maximum(:turn_number) + 1 if Plan.where(status: 'turn').exists?
    end
    @plan.save
    @event = Event.find(plan_params[:measure_id])
    redirect_to @event
  end

  def invite 
    @user = User.find(params[:user_id]) if params[:user_id]
    @event = Event.find(params[:event_id]) if params[:event_id]
  end

  def create_invite 
    @event = Event.find(params[:event_id])
    binding.pry
    #@plan = Plan.create(measure_id: params[:event_id], member_id: params[:user_id], status: 'invite')
    render text: "#{@plan.measure_id} #{@plan.member_id} #{@plan.measure.name} #{@plan.status}"
  end

  def user_answer
    @plan = Plan.find(params[:plan_id])
    @plan.status = 'comming' if params[:answer] == 'comming'
    @plan.status = 'decline' if params[:answer] == 'decline'
    @plan.save
    render text: "#{@plan.inspect}"
  end

  def sent_invites
    binding.pry
  end

  def update
    @plan.update(plan_params)
    if params[:not_comming]
      @plan.destroy
    elsif params[:comming]
      @plan.status = 'comming'
    elsif params[:maybe]
      @plan.status = 'maybe'
     elsif params[:turn]
      @plan.status = 'turn'
      @plan.turn_number = Plan.where(status: 'turn').maximum(:turn_number) + 1
    end
    @plan.save
    @event = Event.find(plan_params[:measure_id])
    redirect_to @event
  end

  def destroy
    @plan.destroy
    respond_with(@plan)
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:status, :measure_id)
    end
end
