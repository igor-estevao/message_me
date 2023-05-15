class MessagesController < ApplicationController

  # This only creates the message object
  # TODO: Message Objects

  def create
    @message = Message.new(body: params[:message][:body])
    chatroom_to_add = Chatroom.find(params[:message][:chatroom_id])
    @message.chatroom_id = chatroom_to_add.id
    if @message.valid?
      if chatroom_to_add.present? and @current_user.chatrooms.include? chatroom_to_add
        @current_user.messages << @message
        # @message.user_id = @current_user.id
        # @message.save
        @message.created_by_current_user = true
      else
        head :error, content_type: "text/turbo-stream"
        flash[:error] = "You are not allowed to send messages to this chatroom!"
      end
    else
      flash[:error] = "There was an error sending this message. Try again later. #{@message.errors.full_messages.to_sentence} "
    end
    @new_message = Message.new(chatroom_id: chatroom_to_add.id)
    # render turbo_stream: true do 
    #   turbo_stream.update(@message.id, partial: "messages/message", locals: {message: @message} )

    #   turbo_stream.replace("new_message", partial: "messages/partials/form", locals: { message: @new_message })
    # end
    respond_to do |format|
      format.turbo_stream {}
    end
  end

private

  def message_params
  end
end
