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
      @plan.status = 'not_comming'
    elsif params[:comming]
      @plan.status = 'comming'
    elsif params[:maybe]
      @plan.status = 'maybe'
    end
    @plan.save
    @event = Event.find(plan_params[:measure_id])
    redirect_to @event
  end

  def update
    @plan.update(plan_params)
    if params[:not_comming]
      @plan.status = 'not_comming'
    elsif params[:comming]
      @plan.status = 'comming'
    elsif params[:maybe]
      @plan.status = 'maybe'
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
