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
    @avatar.save
    respond_with(@avatar)
  end

  def update
    @avatar.update(avatar_params)
    respond_with(@avatar)
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
      params.require(:avatar).permit(:avatar)
    end
end
