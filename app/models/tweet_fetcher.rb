class TweetFetcher

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["KEY"]
      config.consumer_secret     = ENV["SECRET_KEY"]
      config.access_token        = ENV["TOKEN"]
      config.access_token_secret = ENV["SECRET_TOKEN"]
    end
  end

  def find_tweets(word=nil)
    word ||= "barbets"
    @client.search("##{word} -rt", result_type: "recent").take(10)
  end


end
