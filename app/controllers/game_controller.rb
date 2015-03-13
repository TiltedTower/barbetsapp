class GameController < ApplicationController

  def index
    @odds = OddsFeed.new
    @tweet = TweetFetcher.new
    @sorted_games = @odds.games(params[:sport])
    @team_tweets = @tweet.find_tweets(params[:word])
  end

  def show
    @odds = OddsFeed.new
    @game_show = @odds.games(params[:sport])
  end

end
