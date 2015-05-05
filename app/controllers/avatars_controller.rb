class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:show, :edit, :update, :destroy, :background_update]

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
        page = 'avatar.js.erb' if params[:user_page] == 'sign_up' || params[:user_page] ==  'edit_user'
        page = 'event_image.js.erb' if params[:user_page] == 'new_event' || params[:user_page] == 'edit_event'
        #binding.pry
        format.html {
          if params[:avatar][:avatar].present?
            render :crop  ## Render the view for cropping
          else
            redirect_to @avatar, notice: 'User was successfully created.'
          end
          }
        format.js {render page}
        format.json { render action: 'show', status: :created, location: @avatar }
      else
        format.html { render action: 'new' }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @avatar.update(avatar_params)
    page = 'crop_result.js.erb' if params[:user_page] == 'sign_up' || params[:user_page] ==  'edit_user'
    page = 'image_crop.js.erb' if params[:user_page] == 'new_event' || params[:user_page] == 'edit_event'
    @user_page = params[:user_page]
    #page = 'event_image.js.erb' if params[:user_page] == 'new_event'
    respond_to do |format|
      format.html {
        if params[:avatar][:avatar].present?
          render :crop  ## Render the view for cropping
        else
          redirect_to @avatar, notice: 'User was successfully created.'
        end
        }
      format.js {render page}
      format.json { render action: 'show', status: :created, location: @avatar }
    end
    #respond_with(@avatar)
  end

  def destroy
    @avatar.destroy
    respond_with(@avatar)
  end

  def background_create
    @avatar = Avatar.new(avatar_params)
    @avatar.save
    current_user.update_attribute(:background_id, @avatar.id)
    respond_to do |format|
      format.html {
        if params[:avatar][:avatar].present?
          render :crop  ## Render the view for cropping
        else
          redirect_to @avatar, notice: 'User was successfully created.'
        end
        }
      format.js {render 'avatars/background/after_create.js.erb'}
    end
  end

  def background_update
    @avatar.update(avatar_params)
    @user_page = params[:user_page]
    respond_to do |format|
      format.html {
        if params[:avatar][:avatar].present?
          render :crop  ## Render the view for cropping
        else
          redirect_to @avatar, notice: 'User was successfully created.'
        end
        }
      format.js {render 'avatars/background/after_crop.js.erb'}
    end
  end

  private
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    def avatar_params
      params.require(:avatar).permit(:name, :avatar,:avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h )
    end
end
