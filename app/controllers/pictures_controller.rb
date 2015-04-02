class PicturesController < ApplicationController
  def create
  	@picture = Picture.new(picture_params)
    @picture.save
  end

  def index
  	@event = Event.first
  	render 'show'
  end
end
