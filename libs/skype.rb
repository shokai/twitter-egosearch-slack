module EgoSearch
  class Skype
    if Config.skype.kind_of? Hash and Config.skype.has_key? "topic"
      @@chat = ::Skype.chats.find{|c| c.topic == Config.skype.topic }
    elsif Config.skype.kind_of? Hash and Config.skype.has_key? "id"
      @@chat = ::Skype.chats.find{|c| c.id == Config.skype.id }
    else
      raise StandardError, 'skype chat config error, please check "config.yml"'
    end

    def self.post(message)
      @@chat.post message
    end
  end
end
