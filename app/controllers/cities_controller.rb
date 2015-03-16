class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cities = City.all
    respond_with(@cities)
  end

  def show
    respond_with(@city)
  end

  def new
    @city = City.new
    respond_with(@city)
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    @city.save
    respond_with(@city)
  end

  def update
    @city.update(city_params)
    respond_with(@city)
  end

  def destroy
    @city.destroy
    respond_with(@city)
  end

  def autocomplete
    respond_to do |format|
      format.js do
        cities = []
        if request.env["HTTP_REFERER"].index('state_id')
          index = request.env["HTTP_REFERER"].index('state_id') + 9
          state_id = request.env["HTTP_REFERER"][index]
          puts "HHHHHHHHHHHHHH #{I18n.locale}"
          state_id = request.env["HTTP_REFERER"][index..(index+1)] unless request.env["HTTP_REFERER"][index+1] == '&'
          City.where(state_id: state_id).each do |city|
            cities << city.en_name
          end
        else
          City.all.each do |city|
            cities << city.en_name
          end
        end
        render json: cities
      end
    end
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:en_name, :ua_name, :ru_name, :state_id)
    end
end
