class MessagesController < ApplicationController
  before_filter :authenticate_user!
  include ActionController::Live

  skip_before_filter  :verify_authenticity_token
 
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
 
    @path = conversation_path(@conversation)
    $redis.publish "chat_event/params[:conversation_id]}", 'hello'#params[:chat_data].to_json
  end
 
  private
 
  def message_params
    params.require(:message).permit(:body)
  end
end