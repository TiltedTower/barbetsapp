class OddsFeed

  def initialize
  @conn = Faraday.new(:url => 'http://jsonodds.com/api/odds') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter
  end
    @conn.headers = {'JsonOdds-API-Key' => '860e71cd-4ea2-4a51-ac82-a94b01312489'} # make requests with Net::HTTP
  end


  def games(sport)
      game = @conn.get "http://jsonodds.com/api/odds/#{sport}"
      JSON.parse(game.body)
  end

end
