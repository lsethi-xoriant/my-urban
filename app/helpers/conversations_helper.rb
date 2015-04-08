module ConversationsHelper
  def self_or_other(message)
    message.user == current_user ? "self" : "other"
  end

  def self_or_other_1(id)
    puts "HHHHHHHHHHHHH #{id}"
    id.to_i == current_user.id ? "self" : "other"
  end
 
  def message_interlocutor(message)
    message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end
