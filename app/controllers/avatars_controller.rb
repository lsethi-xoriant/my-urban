class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @avatars = Avatar.all
    respond_with(@avatars)
  end

  def show
    respond_with(@avatar)
  end

  def new
    @avatar = Avatar.new
    respond_with(@avatar)
  end

  def edit
  end

  def create
    @avatar = Avatar.new(avatar_params)
    respond_to do |format|
      if @avatar.save
        format.html {
          if params[:avatar][:avatar].present?
            render :crop  ## Render the view for cropping
          else
            redirect_to @avatar, notice: 'User was successfully created.'
          end
          }
        format.js {render 'avatar.js.erb'}
        format.json { render action: 'show', status: :created, location: @avatar }
      else
        format.html { render action: 'new' }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @avatar.update(avatar_params)
    respond_to do |format|
      format.html {
        if params[:avatar][:avatar].present?
          render :crop  ## Render the view for cropping
        else
          redirect_to @avatar, notice: 'User was successfully created.'
        end
        }
      format.js {render 'crop_result.js.erb'}
      format.json { render action: 'show', status: :created, location: @avatar }
    end
    #respond_with(@avatar)
  end

  def destroy
    @avatar.destroy
    respond_with(@avatar)
  end

  private
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    def avatar_params
      params.require(:avatar).permit(:avatar,:avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
    end
end
