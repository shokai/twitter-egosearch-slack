module EgoSearch

  class Slack
    if Config.slack.kind_of? Hash and
        Config.slack.has_key? "team" and
        Config.slack.has_key? "token" and
        Config.slack.has_key? "channel"
      @@chat = ::Slackbot.new Config.slack.team, Config.slack.token
    end

    def self.send(message)
      @@chat.send Config.slack.channel, message
    end
  end

end
