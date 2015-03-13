class OddsFeed

  def initialize
  @odds = Faraday.new(:url => 'http://jsonodds.com/api/odds') do |faraday|
    faraday.request  :url_encoded
    faraday.response :logger
    faraday.adapter  Faraday.default_adapter
  end
    @odds.headers = {'JsonOdds-API-Key' => ENV["API_KEY"]}
  end

  def games(sport)
      game = @odds.get "http://jsonodds.com/api/odds/#{sport}"
      JSON.parse(game.body)
  end

  


end
