class ChatroomsController < ApplicationController

  def index
    if session[:last_opened_chatroom].present?
      @current_chat = Chatroom.find session[:last_opened_chatroom]
      @message = Message.new
      @message.chatroom_id = @current_chat.id
    end
  end

  def show
    session[:last_opened_chatroom] = params[:id]
    @current_chat = Chatroom.find params[:id]
    @message = Message.new
    @message.chatroom_id = @current_chat.id

    render turbo_stream: turbo_stream.replace("current_chat", partial: "chatrooms/current_chat")
  end
end
