module EgoSearch
  class Skype
    @@chat = ::Skype.chats.find{|c| c.id == Config.skype.chat }

    def self.post(message)
      @@chat.post message
    end
  end
end
