class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    redirect_to event_path(@event)
  end
 
  private
    def comment_params
      comment_params = params.require(:comment).permit(:body)
      comment_params[:user_id] = current_user.id
      return comment_params
    end
end
