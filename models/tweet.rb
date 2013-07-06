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
      self.new(
               :status_id => tweet.id.to_s,
               :user => tweet.user,
               :text => tweet.text,
               :time => tweet.time,
               :url => tweet.url
               )
    end
  end
end
