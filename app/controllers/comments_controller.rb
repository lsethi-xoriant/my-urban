class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    name = current_user.first_name + " " + current_user.last_name
    CommentsMailer.comment_to_event(name, @event.user.email, @comment.body, current_user.email).deliver if @comment.valid? 
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js   { render 'events/comments/after_create.js.erb'}
    end   
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js   { render 'events/comments/after_destroy.js.erb'}
    end   
  end
 
  private
    def comment_params
      comment_params = params.require(:comment).permit(:body)
      comment_params[:user_id] = current_user.id
      return comment_params
    end
end
