module EgoSearch
  class Crawler
    include EventEmitter

    def initialize(opts={})
      @nosave = opts[:nosave]
      @client = ::Tw::Client.new
      @client.auth Config.twitter.user
    end

    def start
      Config.words.each do |word|
        @client.search(word).each do |tweet|
          emit :crawl, word, tweet
          next if Tweet.exists? tweet.id
          tweet = Tweet.parse tweet
          unless @nosave
            begin
              tweet.save!
            rescue => e
              emit :error, e
              next
            end
          end
          next if Config.ignore.users.find{|u| tweet.user =~ /#{u}/i }
          next if Config.ignore.words.find{|w| tweet.text =~ /#{w}/i }
          emit :new, word, tweet
        end
      end
    end

  end
end
