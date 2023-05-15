module ApplicationHelper

  def avatar_url_for(chatroom=nil, opts = {})
    size = opts[:size || 32]

    if chatroom.present? && chatroom.avatar.attached?
      chatroom.avatar.variant(
        resize: "#{size}x#{size}!"
      )
    else
      "https://secure.gravatar.com/avatar/?d=mp"
    end
  end

end
