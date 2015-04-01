class PicturesController < ApplicationController
  def create
  	@picture = picture.new(picture_params)
    @picture.save
  end

  def index
  	@event = Event.first
  	render 'show'
  end
end
