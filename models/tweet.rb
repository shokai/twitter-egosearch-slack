module EgoSearch
  class Tweet
    include Mongoid::Document

    field :status_id, :type => String
    field :user, :type => String
    field :text, :type => String
    field :time, :type => Time
    field :url, :type => String

    validates_uniqueness_of :status_id

    def self.parse(tweet)
      raise ArgumentError "instance of Tw::Tweet require" unless tweet.kind_of? Tw::Tweet
      text = tweet.text.gsub(/https?:\/\/[^\s]+/){|s|
        s = URI.parse(s).to_huge.to_s rescue
        s
      }
      self.new(
               :status_id => tweet.id.to_s,
               :user => tweet.user,
               :text => text,
               :time => tweet.time,
               :url => tweet.url
               )
    end

    def to_s
      "@#{user} #{text} - #{time} #{url}"
    end

    def self.exists?(status_id)
      where(:status_id => status_id.to_s).count > 0
    end
  end
end
